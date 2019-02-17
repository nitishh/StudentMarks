package studentmarks

class User {

    String username;
    String password;
    String user_type;

    static constraints = {
        password(size: 5..15)
    }
}
