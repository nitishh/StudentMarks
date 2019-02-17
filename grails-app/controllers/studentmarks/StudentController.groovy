package studentmarks

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class StudentController extends BaseController {

    def index() {
        params.max = 4;
        def studlist = Student.list(params);
        [ulist:studlist, totalrecord: Student.count()]
    }

    def search() {
        if(params.keyword) {
            params.max = 4;
            def studlist = Student.findAllByNameIlike(params.keyword+"%", params);
            def studcount = Student.findAllByNameIlike(params.keyword+"%").size();
            render(view: "index", model: [ulist: studlist, totalrecord: studcount, parmas: params])
        } else {
            redirect(action: "index")
        }
    }


    def create() {

    }

    def save(){
        uploadImage(params);
        def student = new Student(params);

        if(student.save()) {
            redirect(action: 'index');
        } else {
            render(view: "create", model: [studentInstance: student])
            return
        }
    }

    def uploadImage(params)
    {
        String path = grailsApplication.mainContext.servletContext.getRealPath("");
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("studentImage");

        if(!file.getOriginalFilename()) {
            params.filename = params.hiddenImage;
        } else {
            params.filename = file.getOriginalFilename()
        }

        if(file)
        {
            File dir = new File(path + "/images/student/${params.batch}");
            if (!dir.exists()) {
                dir.mkdir();
            }
//            file.transferTo(new File(path+"/images/student/${params.batch}/${file.getOriginalFilename()}"))
//            params.image = file.getOriginalFilename();
            try {
                file.transferTo(new File(path + "/images/student/${params.batch}/${params.filename}"))
            } catch(IOException){}

            params.image = "${params.filename}"
            params.remove("studentImage");
            params.remove("hiddenImage");
        }
    }

    def edit() {
        def stud = Student.get(params.id);
        [studlist:stud]
    }

    def update() {
        uploadImage(params);

        def stud = Student.get(params.id);
        stud.name = params.name;
        stud.address = params.address;
        stud.email = params.email;
        stud.phone = params.phone;
        stud.roll = params.roll;
        stud.batch = params.batch;
        stud.image = params.image;
//print(params.image)
        if(stud.save()) {
            flash.message = "Student updated successfully";
            redirect(action:'index');
        } else {
            render(view:'edit', model:[studlist:'stud']);
        }
    }

    def delete() {
        def stud = Student.get(params.id);

        if(stud) {
            Marksheet.executeUpdate("delete Marksheet m where m.st.id = ?", [stud.id])

            stud.delete();
            flash.message = "Student deleted Successfully";
            redirect(action:'index');
        } else {
            flash.message = "Student doesn't exists";
            redirect(action:'index');
        }
    }
}
