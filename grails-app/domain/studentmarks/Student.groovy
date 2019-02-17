package studentmarks

class Student {

    String name;
    String address;
    String email;
    String phone;
    String roll;
    String batch;
    String image;
    static constraints = {
        name(blank: false,nullable: false,minSize: 3)
        email(email: true)
    }
}
