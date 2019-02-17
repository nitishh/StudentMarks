package studentmarks

class LoginController {

    def index() {}

    def postLogin() {
        if (params.username && params.password) {
            def user = User.findAllByUsernameAndPassword(params.username, params.password);
            if (user) {
                session.userid = user.id;
                session.username = user.username;
                session.user_type = user.user_type;
//                print(session.user_type);
                redirect(action: 'index', controller: 'user');
            } else {
                flash.message = "UserName and Password combination does not match."
                redirect(action: 'index');
            }
        } else {
            flash.message = "UserName and Password combination does not match."
            redirect(action: 'index');
        }
    }

    def logout() {
        if(session.userid) {
            session.userid="";
            session.username="";
            session.user_type="";
            session.invalidate();
            redirect(action: "index")
        }
    }
}
