package studentmarks

class BaseController {
    def beforeInterceptor = [action: this.&auth];

    def auth(){
        if(!session.userid) {
            redirect(action: 'index', controller: 'login')
        }
    }

}
