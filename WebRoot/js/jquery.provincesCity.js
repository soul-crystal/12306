 ///<reference path="js/jquery.min.js"/>
$.fn.ProvinceCity = function(){
	var _self = this;
	//分别获取3个下拉框
	var $sel1 = $("#province");
	var $sel2 = $("#city");
	var $sel3 = $("#district");
	 $(function(){
		 $.ajax({
			 url:"./Province.do",
			 type:"POST",
			 success:function(p){
				 var json=eval(p);
					for(var i in json)
						{
						 $sel1.append( "<option value="+json[i].id+">" + json[i].name + "</option>");
						} 	 
			 }
		 })
	 })
	
	$sel1.change(function(){
         var province = $(this).val();
         $.ajax({
             url: './City.do',
             type: 'POST',
             data: 'province='+province,
             dataType:'json',
             success: function(json) {
            	 	var p=eval(json);
                	 $sel2[0].options.length=1;
             		$sel3[0].options.length=1;
                     for(var i in p){
                         $sel2.append( "<option value="+p[i].id+">" + p[i].name + "</option>");
                     };
                 
             }
         });
     });

     $sel2.change(function(){
         var city = $(this).val();
         $.ajax({
             url: './District.do',
             type: 'POST',
             data: "cityid="+city,
             dataType:'json',
             success: function(json) {
               
                	 $sel3[0].options.length=1;
                	 var p=eval(json)
                    for(var i in p)
                    { $sel3.append( "<option value="+p[i].id+">" + p[i].name + "</option>");
                     }
                 } 
             }
         );
         
     });



     return _self

};