
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Bootstrap core CSS -->
<script type="text/javascript">
 

</script>
<div class="modal fade appointment-modal"
     id="appointment-modal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">

<div class="modal-dialog tutors-modal">
    <div class="modal-content tutors-modal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Reporter Details</h4>
        </div>
        <div class="modal-body" style="height: 575px; left: 2.5%;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">     
                        <div class="alert alert-danger"><span class="glyphicon glyphicon-alert"></span>
                            <form role="form" action="/portal/make-appointment/" method="post" id="appointment_form" class="form-horizontal">
                                <div class="col-lg-6">

                                    <div id="reporterInfo">
                                    	<table>
										<tr>
										<td style="text-align: center;">${changeValueType}</td>
										<td style="text-align: center;">Reporter Name</td>
										<td style="text-align: center;">
											<input type="text" id="reporterName" name="reporterName" size="8" maxlength="20" class="form-control" 
													style="font-weight:bold ;text-align: right; background-color: #CDFFC2"> 
										</td>
										</tr>
										</table>
                                    </div>
                                    <input type="submit" name="submit" id="submit" value="Schedule Appointment" class="btn btn-info pull-right">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
        </div>
    </div>
</div>
</div>