

let arr = [];
$('#goalbtn').on('click', ()=>{
	let goal_type = $('#goal_type').val();
	let current_price = $('#current_price').val();
	let time = $('#time').val();
	let temp = [goal_type, current_price, time];
	arr.push(temp);
});