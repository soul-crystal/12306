
function getdate() {
		var now = new Date()
		y = now.getFullYear()
		m = now.getMonth() + 1
		d = now.getDate()
		m = m < 10 ? "0" + m : m
		d = d < 10 ? "0" + d : d
		return y + "-" + m + "-" + d
	}
