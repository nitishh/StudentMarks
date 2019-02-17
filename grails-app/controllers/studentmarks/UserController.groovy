package studentmarks

class UserController extends BaseController {


//    def scaffold = true;
    def create() {

    }

    def search()
    {
        if(params.keyword){
            params.max=4;
            def userList = User.findAllByUsernameIlikeOrUser_typeLike(params.keyword+"%",params.keyword+"%",params);
            def userCount =  User.findAllByUsernameIlikeOrUser_typeLike(params.keyword+"%",params.keyword+"%").size();
            render (view: "index",model: [ulist:userList,totalrecord: userCount,params:params])
        }else {
            redirect(action:"index")
        }
    }
    def index() {
        params.max = 4;
        def userlist = User.list(params);
        [ulist:userlist, totalrecord: User.count()]
    }

    def save(){
        def user = new User(params);
        if(user.save()) {
            redirect(action: 'index');
        } else {
            redirect(action: 'create');
        }

//        def user2 = new User();
//        user2.username = params.username;
//        user2.password = params.password;
//        if(user2.save())
    }

    def edit(){
        def user = User.get(params.id);
        [userinfo:user]
    }

    def update() {
        def user = User.get(params.id);
        user.username = params.username;
        user.password = params.password;
        user.user_type = params.user_type;

        if(user.save()) {
            flash.message = "User updated successfully";
            redirect(action: 'index');
        } else {
            //redirect(action: 'edit');
//            since we already have student object created, so instead of sending it to edit method we can
//            directly call view with render
            render(view: 'edit', model:[userinfor:user]);
        }
    }

    def delete() {
        def user = User.get(params.id);

        if(user) {
            user.delete();
            flash.message = "User deleted successfully";
            redirect(action: 'index');
        } else {
//            is call when user press jpt value in url to delete user
            flash.message = "User Doesn't exists";
            redirect(actoin: 'index');
        }
    }
}
