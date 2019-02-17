package studentmarks

import java.text.DecimalFormat

class HomeController {

    def index() {}

    def result() {
//        if(params.batch && params.rollno) {
            Student St = Student.findByBatchAndRoll(params.batch, params.rollno)

            def markInfo = Marksheet.findAllBySt(St)

            if(markInfo) {
                def markObt = Marksheet.findAllBySt(St).marks.sum()

                def totMark = Marksheet.findAllBySt(St).sj.total_mark.sum()

                DecimalFormat twoDForm = new DecimalFormat("#.##");
                def percent = Double.valueOf(twoDForm.format(markObt/totMark * 100))

                String result = "PASSED"
                for(int i = 0; i< markInfo.size(); i++) {
                    if(markInfo[i].marks < 40) {
                        result = "FAILED"
                    }
                }
                render(view: 'result', model: [markInformation: markInfo, markObtained: markObt, totalMark: totMark, percentage: percent, res: result])
            } else {
                flash.message = "Batch and Roll number doesn't match"
                redirect(action: 'index')
            }
//        } else {
//            redirect(action: 'index')
//        }
    }

    def showAjax() {
//        if(params.batch && params.rollno) {
        print("I am in controller")
        Student St = Student.findByBatchAndRoll(params.batch, params.rollno)

        def markInfo = Marksheet.findAllBySt(St)

        if(markInfo) {
            def markObt = Marksheet.findAllBySt(St).marks.sum()

            def totMark = Marksheet.findAllBySt(St).sj.total_mark.sum()

            DecimalFormat twoDForm = new DecimalFormat("#.##");
            def percent = Double.valueOf(twoDForm.format(markObt/totMark * 100))

            String result = "PASSED"
            for(int i = 0; i< markInfo.size(); i++) {
                if(markInfo[i].marks < 40/100*markInfo.sj.total_mark) {
                    result = "FAILED"
                }
            }
            render(view: 'result', model: [markInformation: markInfo, markObtained: markObt, totalMark: totMark, percentage: percent, res: result])
        } else {
            flash.message = "Batch and Roll number doesn't match"
            redirect(action: 'index')
        }
//        } else {
//            redirect(action: 'index')
//        }
    }

}


