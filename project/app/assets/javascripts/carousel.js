$(document).ready(function() {
	if ($(".carousel-item").length > 0) {
		var switch_delay = 5000;

		$(".carousel-item.item1").addClass("active");
		$(".carousel-item.item2").removeClass("active");
		$(".carousel-item.item3").removeClass("active");

		setTimeout(function() {
			$(".carousel-item.item1").removeClass("active");
			$(".carousel-item.item2").addClass("active");
			$(".carousel-item.item3").removeClass("active");
		}, switch_delay);

		setTimeout(function() {
			$(".carousel-item.item1").removeClass("active");
			$(".carousel-item.item2").removeClass("active");
			$(".carousel-item.item3").addClass("active");
		}, switch_delay * 2);

		setInterval(function() {
			$(".carousel-item.item3").toggleClass("active");
			$(".carousel-item.item1").toggleClass("active");
		}, switch_delay * 3);

		setTimeout(function() {
			setInterval(function() {
				$(".carousel-item.item1").toggleClass("active");
				$(".carousel-item.item2").toggleClass("active");
			}, switch_delay * 3);
		}, switch_delay);

		setTimeout(function() {
			setInterval(function() {
				$(".carousel-item.item2").toggleClass("active");
				$(".carousel-item.item3").toggleClass("active");
			}, switch_delay * 3);
		}, switch_delay * 2);
	}
});