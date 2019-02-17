package studentmarks

class SubjectController extends BaseController {


    def index() {
        params.max = 4;

        def subjlist = Subject.list(params);
        [ulist: subjlist, totalrecord: Subject.count()]
    }

    def create() {

    }

    def submit() {
        if(params.keyword) {
            params.max = 4;
            def sublist = Subject.findAllByNameIlike(params.keyword + "%", params);
            def subcount = Subject.findAllByNameIlike(params.keyword + "%").size();

            render(view: "index", model: [ulist: sublist, totalrecord: subcount, params:params]);

        } else {
            redirect(action: 'index')
        }
    }

    def save() {
        def sub = new Subject(params);
        if(sub.save()) {
            redirect(action: 'index');
        } else {
            redirect(action: 'create');
        }
    }

    def edit() {
        def sub = Subject.get(params.id);
        [subinfo: sub]
    }

    def update() {
        def sub = Subject.get(params.id);

//        Marksheet.executeUpdate("delete from Marksheet m where m.sj.id = ?", [sub.id])

        sub.name = params.name;
        sub.total_mark = Integer.parseInt(params.total_mark);

        if(sub.save()) {
            flash.message = "Subject updated successfully";
            redirect(action: 'index');
        } else {
            render(view: 'edit', model: [subinfo: sub]);
        }
    }

    def delete() {
        def sub = Subject.get(params.id);

        if(sub) {
            Marksheet.executeUpdate("delete from Marksheet m where m.sj.id = ?", [sub.id])
            sub.delete();
            flash.message = "Subject deleted successfully";
            redirect(action:'index');
        } else {
            flash.message = "Subject doesn't exists";
            redirect(action:'index');
        }
    }
}
