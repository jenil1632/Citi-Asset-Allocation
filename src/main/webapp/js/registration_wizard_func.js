/*  Wizard */
var page = 0;
var back = false;
var extra = 0;
var goaltum =1;
$("#goalbtn").on('click', (e)=>{
	e.preventDefault();
	goaltum++;
});

jQuery(function ($) {
	"use strict";
	$('form#wrapped').attr('action', 'info');
	$("#wizard_container").wizard({
		stepsWrapper: "#wrapped",
		submit: ".submit",
		beforeSelect: function (event, state) {
			console.log(page);
			if(back==false&&page<3)
				{
				page++;
				}
			if(back==true)
				{
				back = false;
				}
			if(page==1)
				{
				//page++;
				var name = $('#name').val();
				var age = $('#age').val();
				var income = $('#income').val();
				var expenditure = $('#expenditure').val();
				var dependnum = $('#dependnum').val();
				if(name==''){
					alert('Please enter your name');
					$('#name').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(name)==true) {
					alert('Please enter character values for the name');
					$('#name').focus();
					page--;
					return false;
				}
				else if(age==''){
					alert('Please enter your age');
					$('#age').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(age)==false) {
					alert('Please enter correct data for age');
					$('#age').focus();
					page--;
					return false;
				}
				else if (age<18) {
					alert('Age should be above 18');
					$('#age').focus();
					page--;
					return false;
				}
				else if (age>90) {
					alert('Age should be below 90');
					$('#age').focus();
					page--;
					return false;
				}
				else if(income==''){
					alert('Please enter your income');
					$('#income').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(income)==false || income<=0) {
					alert('Please enter valid income');
					$('#income').focus();
					page--;
					return false;
				}
				else if(expenditure==''){
					alert('Please enter your expenditure');
					$('#expenditure').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(expenditure)==false || expenditure <0) {
					alert('Please enter valid expenditure');
					$('#expenditure').focus();
					page--;
					return false;
				}
				else if(Number(expenditure) > Number(income)){
					alert('Sorry, Expenditure exceeds Income');
					$('#expenditure').focus();
					page--;
					return false;
				}
				else if(dependnum==''){
					alert('Please enter your Financial Dependents');
					$('#dependnum').focus();
					page--;
					return false;
				}
				else if (Number.isInteger(Number(dependnum))==false || dependnum<0) {
					alert('Enter valid data for financial dependents');
					$('#dependnum').focus();
					page--;
					return false;
				}
				else if (dependnum>15) {
					alert('Number of Financial dependents should be less than 15');
					$('#dependnum').focus();
					page--;
					return false;
				}
				}
			else if(page==2)
			{	
				//page++;
				var stocks=$('#stocks').val();
				var bonds=$('#bonds').val();
				var gold=$('#gold').val();
				var deposits=$('#deposits').val();
				var sum = parseInt(stocks)+parseInt(bonds)+parseInt(gold)+parseInt(deposits);
				if($('#curport3').is(':checked')) {
					return true;
				}
				else if($('#curport1').is(':checked')==false && $('#curport2').is(':checked')==false && $('#curport3').is(':checked')==false) {
					alert('Please choose at least one option');
					page--;
					return false;
				}
				else if(stocks==''){
					alert('Please fill up all portfolio details and if not applicable enter 0');
					$('#stocks').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(stocks)==false || stocks<0) {
					alert('Enter valid value for stocks');
					$('#stocks').focus();
					page--;
					return false;
				}
				else if(bonds==''){
					alert('Please fill up all portfolio details and if not applicable enter 0');
					$('#bonds').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(bonds)==false || bonds<0) {
					alert('Enter valid value for bonds');
					$('#bonds').focus();
					page--;
					return false;
				}
				else if(gold==''){
					alert('Please fill up all portfolio details and if not applicable enter 0');
					$('#gold').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(gold)==false || gold<0) {
					alert('Enter valid value for bonds');
					$('#gold').focus();
					page--;
					return false;
				}
				else if(deposits==''){
					alert('Please fill up all portfolio details and if not applicable enter 0');
					$('#deposits').focus();
					page--;
					return false;
				}
				else if (jQuery.isNumeric(deposits)==false || deposits<0) {
					alert('Enter valid value for deposits');
					$('#deposits').focus();
					page--;
					return false;
				}
				else if(parseInt(sum)<=0){
					alert('Please fill up valid portfolio details');
					page--;
					return false;
				}
			}
			else if(page==3){
				//page++;
				extra++;
				var assets1=$("#assets1").val();
				var assets2=$("#assets2").val();
				var assets3=$("#assets3").val();
				var assets4=$("#assets4").val();
				var year1=$("#year1").val();
				var year2=$("#year2").val();
				var year3=$("#year3").val();
				var year4=$("#year4").val();
				var goal_type1=$("#goal_type1").val();
				var goal_type2=$("#goal_type2").val();
				var goal_type3=$("#goal_type3").val();
				var goal_type4=$("#goal_type4").val();
				
								
				console.log(goaltum);
				if(goaltum==1){
					if(goal_type1==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					else if(assets1==''){
						alert('Please fill goal amount');
						$('assets1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets1)==false || assets1<=0) {
						alert('Enter valid value for funds in goal 1');
						$('assets1').focus();
						page--;extra--;
						return false;
					}
					else if(year1==''){
						alert('Please fill time limit');
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year1)==false || year1<=0) {
						alert('Enter valid value for year');
						$('year1').focus();
						page--;extra--;
						return false;
					}
					else if (year1>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('year1').focus();
						page--;extra--;
						return false;
					}
				}
				else if(goaltum==2){
					if(goal_type1==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type2==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(assets1==''){
						alert('Please fill goal amount');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets1)==false || assets1<=0) {
						alert('Enter valid value for funds in goal 1');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if(assets2==''){
						alert('Please fill goal amount');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets2)==false || assets2<=0) {
						alert('Enter valid value for funds in goal 2');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if(year1==''){
						alert('Please fill time limit');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year1)==false || year1<=0) {
						alert('Enter valid value for year');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (year1>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if(year2==''){
						alert('Please fill time limit');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year2)==false || year2<=0) {
						alert('Enter valid value for year');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (year2>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if(year1==year2){
						alert('Your goals should be in different years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
				}
				else if(goaltum==3){
					if(goal_type1==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type2==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type3==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(assets1==''){
						alert('Please fill goal amount');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets1)==false || assets1<=0) {
						alert('Enter valid value for funds in goal 1');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if(assets2==''){
						alert('Please fill goal amount');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets2)==false || assets2<=0) {
						alert('Enter valid value for funds in goal 2');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if(assets3==''){
						alert('Please fill goal amount');
						$('#assets3').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets3)==false || assets3<=0) {
						alert('Enter valid value for funds in goal 3');
						$('#assets3').focus();
						page--;extra--;
						return false;
					}
					else if(year1==''){
						alert('Please fill time limit');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year1)==false || year1<=0) {
						alert('Enter valid value for year');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (year1>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year1').focus();
						page--;extra--;
						return false;
					}else if(year2==''){
						alert('Please fill time limit');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year2)==false || year2<=0) {
						alert('Enter valid value for year');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (year2>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if(year3==''){
						alert('Please fill time limit');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year3)==false || year3<=0) {
						alert('Enter valid value for year');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if (year3>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if(year1==year2){
						alert('Your goals should be in different years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if(year2==year3){
						alert('Your goals should be in different years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if(year3==year1){
						alert('Your goals should be in different years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					
				}
				else if(goaltum==4){
					if(goal_type1==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type2==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type3==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(goal_type4==0){
						alert('Please select goal type');
						page--;extra--;
						return false;
					}
					if(assets1==''){
						alert('Please fill goal amount');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets1)==false || assets1<=0) {
						alert('Enter valid value for funds in goal 1');
						$('#assets1').focus();
						page--;extra--;
						return false;
					}
					else if(assets2==''){
						alert('Please fill goal amount');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets2)==false || assets2<=0) {
						alert('Enter valid value for funds in goal 2');
						$('#assets2').focus();
						page--;extra--;
						return false;
					}
					else if(assets3==''){
						alert('Please fill goal amount');
						$('#assets3').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets3)==false || assets3<=0) {
						alert('Enter valid value for funds in goal 3');
						$('#assets3').focus();
						page--;extra--;
						return false;
					}
					else if(assets4==''){
						alert('Please fill goal amount');
						$('#assets4').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(assets4)==false || assets4<=0) {
						alert('Enter valid value for funds in goal 4');
						$('#assets4').focus();
						page--;extra--;
						return false;
					}
					else if(year1==''){
						alert('Please fill time limit');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year1)==false || year1<=0) {
						alert('Enter valid value for year');
						$('#year1').focus();
						page--;extra--;
						return false;
					}
					else if (year1>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year1').focus();
						page--;extra--;
						return false;
					}else if(year2==''){
						alert('Please fill time limit');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year2)==false || year2<=0) {
						alert('Enter valid value for year');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if (year2>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if(year3==''){
						alert('Please fill time limit');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year3)==false || year3<=0) {
						alert('Enter valid value for year');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if (year3>15) {
						alert('Time limit for individual goals should not exceed 15 years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if(year4==''){
						alert('Please fill time limit');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					else if (jQuery.isNumeric(year4)==false || year4<=0) {
						alert('Enter valid value for year');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					else if (year4>15) {
						alert('Time period for individual goals should not exceed 15');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					else if(year1==year2){
						alert('Your goals should be in different years');
						$('#year2').focus();
						page--;extra--;
						return false;
					}
					else if(year2==year3){
						alert('Your goals should be in different years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if(year3==year1){
						alert('Your goals should be in different years');
						$('#year3').focus();
						page--;extra--;
						return false;
					}
					else if(year4==year1){
						alert('Your goals should be in different years');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					else if(year4==year2){
						alert('Your goals should be in different years');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					else if(year4==year3){
						alert('Your goals should be in different years');
						$('#year4').focus();
						page--;extra--;
						return false;
					}
					
				}
				
			}
			if (!state.isMovingForward)
				return true;
			var inputs = $(this).wizard('state').step.find(':input');
			return !inputs.length || !!inputs.valid();
		}
	}).validate({
		errorPlacement: function (error, element) {
			if (element.is(':radio') || element.is(':checkbox')) {
				error.insertBefore(element.next());
			} else {
				error.insertAfter(element);
			}
		}
	});
	//  progress bar
	$("#progressbar").progressbar();
	$("#wizard_container").wizard({
		afterSelect: function (event, state) {
			$("#progressbar").progressbar("value", state.percentComplete);
			$("#location").text("(" + state.stepsComplete + "/" + state.stepsPossible + ")");
		}
	});
	/* Submit loader mask */
	$('form').on('submit',function() {
		var form = $("form#wrapped");
		form.validate();
		if (form.valid()) {
			$("#loader_form").fadeIn();
		}
	});
});

$('.backward').on('click', ()=>{
	console.log('backwards');
	if(extra>0)
		{
		extra--;
		}
	else
		{
		page--;
		}
	back = true;
});
