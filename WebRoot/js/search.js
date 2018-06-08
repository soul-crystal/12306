
function getdate() {
		var now = new Date()
		y = now.getFullYear()
		m = now.getMonth() + 1
		d = now.getDate()
		m = m < 10 ? "0" + m : m
		d = d < 10 ? "0" + d : d
		return y + "-" + m + "-" + d
	}
	$(document).ready(
			function() {
				$('#train_start_date').click(function() {
					WdatePicker({
						doubleCalendar : true,
						dateFmt : 'yyyy-MM-dd',
						minDate : getdate(),
						maxDate : enddate()
					});
				});
				$('#train_start_date').val(getdate());
				var listTableWidth = $('#listTable').width();
				$('#floatTable').width(listTableWidth);
				$(window).resize(function() { //窗口改变大小事件
					var listTableWidth = $('#listTable').width();
					$('#floatTable').width(listTableWidth);
				});
				$(window).scroll(
						function() { //鼠标滚轮事件
							var listTableWidth = $('#listTable').width();
							$('#floatTable').width(listTableWidth);
							var scrollPos;
							if (window.pageYOffset) {
								scrollPos = window.pageYOffset;
							} else if (document.compatMode
									&& document.compatMode != 'BackCompat') {
								scrollPos = document.documentElement.scrollTop;
							} else if (document.body) {
								scrollPos = document.body.scrollTop;
							}
							if (scrollPos > 155) {
								$('#floatTable').css('display', 'block');
							} else {
								$('#floatTable').css('display', 'none');
							}
						});
			})
	function searchTrain(type) {
		var fromStationText = $('#fromStationText').val(); //出发地
		var toStationText = $('#toStationText').val(); //目的地
		var train_start_date = $('#train_start_date').val(); //出发日
		if (fromStationText == '') {
			alert("出发地不能为空!");
			$('#fromStationText').focus();
			return;
		}
		if (toStationText == '') {
			alert('目的地不能为空!');
			$('#toStationText').focus();
			return;
		}
		if (train_start_date == '') {
			alert('出发日不能为空!');
			$('#train_start_date').focus();
			return;
		}
		if (station_names.indexOf(fromStationText) < 0) {
			alert("请 输入正确的出发地!");
			$('#fromStationText').focus();
			$('#fromStationText').select();
			return;
		}
		if (station_names.indexOf(toStationText) < 0) {
			alert("请输入正确的目的地!");
			$('#toStationText').focus();
			$('#toStationText').select();
			return;
		}
		fromStationText = station_names.substring(station_names.indexOf("|"
				+ fromStationText + "|")
				+ fromStationText.length + 2, station_names.length);
		fromStationText = fromStationText.substring(0, fromStationText
				.indexOf('|'));
		toStationText = station_names.substring(station_names.indexOf("|"
				+ toStationText + "|")
				+ toStationText.length + 2, station_names.length);
		toStationText = toStationText.substring(0, toStationText.indexOf('|'));
		$
				.ajax({
					type : 'post',
					url : './searchTrain.do?from_station=' + fromStationText
							+ '&to_station=' + toStationText
							+ '&queryDate=' + train_start_date
							+ "&purpose_codes=" + type,
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					dataType : 'json',
					onbeforeunload : $('.dhx_modal_cover').css('display',
							'block'),
					success : function(json) {
						$('.dhx_modal_cover').css('display', 'none');
						var tbody = document.getElementById('tbody');
						var tbodyLength = tbody.rows.length;
						for (var i = 0; i < tbodyLength; i++) {
							tbody.deleteRow(0);
						}
						if (json == null) {
							alert("网络连接异常,请稍后重试!");
							return;
						}
						var message = json.data.message;
						if (message != undefined) {
							alert(message);
							return;
						} else {
							var count = json.data.datas.length;
							document.getElementById('title_div').innerHTML = $(
									'#fromStationText').val()
									+ " ->"
									+ $('#toStationText').val()
									+ "("
									+ json.data.searchDate
									+ ")共计"
									+ count
									+ "个车次";
							for (var i = count - 1; i > -1; i--) {
								var newRow = tbody.insertRow();
								newRow.id = "tr_" + i;
								document.getElementById("tr_" + i).onmouseover = function() {
									this.style.backgroundColor = "#eef1f8";
								};
								document.getElementById("tr_" + i).onmouseout = function() {
									this.style.backgroundColor = "";
								};
								var cell0 = newRow.insertCell(0); //车次
								cell0.innerHTML = "<a style='font-size: 16px;color: #333;text-decoration: underline;font-weight: 700;' >"
										+ json.data.datas[i].station_train_code
										+ "</a>";
								var cell1 = newRow.insertCell(1); //出发站
								cell1.innerHTML = json.data.datas[i].start_station_name;
								var cell2 = newRow.insertCell(2); //到达站
								cell2.innerHTML = json.data.datas[i].end_station_name;
								var cell3 = newRow.insertCell(3); //出发时间
								cell3.innerHTML = json.data.datas[i].start_time;
								var cell4 = newRow.insertCell(4); //到达时间
								cell4.innerHTML = json.data.datas[i].arrive_time;
								var cell5 = newRow.insertCell(5);
								cell5.innerHTML = "-";
								var cell6 = newRow.insertCell(6); //商务座
								cell6.innerHTML = json.data.datas[i].swz_num;
								var cell7 = newRow.insertCell(7); //特等座
								cell7.innerHTML = json.data.datas[i].tz_num;
								var cell8 = newRow.insertCell(8); //一等座
								cell8.innerHTML = json.data.datas[i].zy_num;
								var cell9 = newRow.insertCell(9); //二等座
								cell9.innerHTML = json.data.datas[i].ze_num;
								var cell10 = newRow.insertCell(10); //高级软卧
								cell10.innerHTML = json.data.datas[i].gr_num;
								var cell11 = newRow.insertCell(11); //软卧
								cell11.innerHTML = json.data.datas[i].rw_num;
								var cell12 = newRow.insertCell(12); //硬卧
								cell12.innerHTML = json.data.datas[i].yw_num;
								var cell13 = newRow.insertCell(13); //软座
								cell13.innerHTML = json.data.datas[i].rz_num;
								var cell14 = newRow.insertCell(14); //硬座
								cell14.innerHTML = json.data.datas[i].yz_num;
								var cell15 = newRow.insertCell(15); //无座
								cell15.innerHTML = json.data.datas[i].wz_num;
								var cell16 = newRow.insertCell(16); //其它
								cell16.innerHTML = json.data.datas[i].qt_num;
								var cell17 = newRow.insertCell(17); //其它
								cell17.innerHTML = "-";
							}
						}
					}
				})
	}