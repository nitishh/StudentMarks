package studentmarks

import org.springframework.dao.DataIntegrityViolationException
class MarksheetController extends BaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
        def batch_list = Student.executeQuery("Select distinct batch from Student as s");
        params.max = 4;
        [marksheetInstanceList: Marksheet.list(params), marksheetInstanceTotal: Marksheet.count(), batch_list: batch_list]
    }

    def create() {
        [marksheetInstance: new Marksheet(params)]
    }

    def save() {
        def marksheetInstance = new Marksheet(params)

        if(marksheetInstance.sj.total_mark < Integer.parseInt(params.marks)) {
            flash.message = "Total mark of " + marksheetInstance.sj.name + " is " + marksheetInstance.sj.total_mark + ". So mark obtaind" +
                    " should not be greater than that.";
            render(view: "edit", model: [marksheetInstance: marksheetInstance])
            return
        }

        if (!marksheetInstance.save(flush: true)) {
            render(view: "create", model: [marksheetInstance: marksheetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), marksheetInstance.id])
//        redirect(action: "show", id: marksheetInstance.id)
        redirect(action: 'index')
    }

    def show(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        [marksheetInstance: marksheetInstance]
    }

    def edit(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        [marksheetInstance: marksheetInstance]
    }

    def update(Long id, Long version) {
        def marksheetInstance = Marksheet.get(id)

        if(marksheetInstance.sj.total_mark < Integer.parseInt(params.marks)) {
            flash.message = "Total mark of " + marksheetInstance.sj.name + " is " + marksheetInstance.sj.total_mark + ". So mark obtaind" +
                    " should not be greater than that.";
            render(view: "edit", model: [marksheetInstance: marksheetInstance])
            return
        }

        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (marksheetInstance.version > version) {
                marksheetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'marksheet.label', default: 'Marksheet')] as Object[],
                        "Another user has updated this Marksheet while you were editing")
                render(view: "edit", model: [marksheetInstance: marksheetInstance])
                return
            }
        }

        marksheetInstance.properties = params

        if (!marksheetInstance.save(flush: true)) {
            render(view: "edit", model: [marksheetInstance: marksheetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), marksheetInstance.id])
//        redirect(action: "show", id: marksheetInstance.id)
        redirect(action: 'index')
    }

    def delete(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        try {
            marksheetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "show", id: id)
        }
    }

    def delete2() {
        def marksheet = Marksheet.get(params.id);
        if(marksheet) {
            marksheet.delete();
            flash.message = "Marksheet deleted successfully";
            redirect(action: 'index');
        } else {
            flash.message = "Marksheet doesn't exists.";
            redirect(action: 'index');
        }
    }

    def marksheet_gen() {
//        CALL result('2017');

    }
}
