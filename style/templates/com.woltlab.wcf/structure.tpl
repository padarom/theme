{include file='documentHeader'}
<head>
    <title>Clan Structure</title>

    {include file='headInclude' sandbox=false}
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.12/d3.js"></script>
    <!--<script src="wcf/js/3rdParty/getorgchart/d3-jetpack.js"></script>-->
    <script src="wcf/js/3rdParty/getorgchart/d3plus.js"></script>
    <script src="wcf/js/3rdParty/getorgchart/getorgchart.js"></script>
    <link href="wcf/js/3rdParty/getorgchart/getorgchart.css" rel="stylesheet" />
    
    <style>
	.get-box, .get-cassandra-border {
		//width: 300px;
	}
	.get-oc-c {
		top: 46px !important;
	}
	svg {
		padding: 0 10px !important;
	}
	.get-text-0 {
		font-size: 60px !important;
		text-align: center !important;
	}
	.get-text-1 {
		font-size: 30px !important;
	}
	.get-text-large { 
		font-size: 36px !important;
		text-align: right !important;
	}
	.get-label {
		font-weight: bold !important;
	}
	.get-data {
		margin-bottom: 10px !important;
	}
	.get-data[data-field-name="PositionName"] {
		font-size: 48px !important;
		margin-bottom: 30px !important;
	}
	div[data-field-name="User I Ds"] {
		display:none;
	}
	.get-image-pane img {
		max-height: 300px !important;
	}
	.logo-image {
		/*max-width: 200px;*/
		max-height: 100px;
	}
	.get-cassandra-text {
		word-wrap: break-word !important;
	}
	.highlightedNode {
		fill: #D24726 !important;
	}
	.get-image-pane {
		height: 85% !important;
	}
	.shape {
		fill: #eee;
		stroke: #ccc;
	}
	rect.get-darkred {
		fill: #AC193D !important;
	}
	rect.get-darkred:hover {
		fill: #CF4C6F !important;
	}
	rect.get-darkred + .get-cassandra-text {
		fill: #FFFFFF !important;
	}
	rect.get-pink {
	    	fill: #DC4FAD !important;
	}
	
	rect.get-darkorange {
	    	fill: #D24726 !important;
	}
	rect.get-darkorange:hover {
		fill: #F57A59 !important;
	}
	rect.get-darkorange + .get-cassandra-text {
		fill: #FFFFFF !important;
	}
	
	rect.get-orange {
	    	fill: #FF8F32 !important;
	}
	
	rect.get-lightgreen {
	    	fill: #82BA00 !important;
	}
	
	rect.get-green {
	    	fill: #008A17 !important;
	}
	rect.get-green:hover {
		fill: #33BD4A !important;
	}
	rect.get-green + .get-cassandra-text {
		fill: #FFFFFF !important;
	}
	
	rect.get-lightteal {
	    	fill: #03B3B2 !important;
	}
	
	rect.get-teal {
	    	fill: #008299 !important;
	}
	
	rect.get-lightblue {
	    	fill: #5DB2FF !important;
	}
	rect.get-lightblue:hover {
		fill: #8FE5FF!important;
	}
	rect.get-lightblue + .get-cassandra-text {
		fill: #000000 !important;
	}
	
	rect.get-blue {
	    	fill: #0072C6 !important;
	}
	rect.get-blue:hover {
		fill: #33A5F9 !important;
	}
	rect.get-blue + .get-cassandra-text {
		fill: #FFFFFF !important;
	}
	
	rect.get-darkpurple {
	    	fill: #4617B4 !important;
	}
	
	rect.get-purple {
	    	fill: #8C0095 !important;
	}
	
	rect.get-mediumdarkblue {
	    	fill: #004B8B !important;
	}
	
	rect.get-darkblue {
	    	fill: #001940 !important;
	}
	
	rect.get-cordovan {
	    	fill: #570000 !important;
	}
	
	rect.get-darkcordovan {
	    	fill: #380000 !important;
	}
	
	rect.get-neutralgrey {
	    	fill: #8B8B8B !important;
	}
	rect.get-neutralgrey:hover {
		fill: #BEBEBE !important;
	}
	rect.get-neutralgrey + .get-cassandra-text {
		fill: #FFFFFF !important;
	}
	
	rect.get-black 
	    	fill: #000 !important;
	}
	#legend {
		margin-top: 10px;
	}
	#legend span {
		display: inline-block;
		width: 100px;
		margin-right: 10px;
		font-size: 10px;
		color: #fff;
		text-align: center;
	}
	#legend .upper-command {
		background-color: #AC193D;
	}
	#legend .upper-command:after {
		content: "Upper Command";
	}
	#legend .command-advisor {
		background-color: #D24726;
	}
	#legend .command-advisor:after {
		content: "Command Advisor";
	}
	#legend .jcs {
		background-color: #0072C6;
	}
	#legend .jcs:after {
		content: "JCS";
	}
	#legend .joint-staff {
		background-color: #008A17;
	}
	#legend .joint-staff:after {
		content: "Joint Staff";
	}
	#legend .nco {
		background-color: #5DB2FF;
		color: #000;
	}
	#legend .nco:after {
		content: "NCO";
	}
	#legend .staff {
		background-color: #8B8B8B;
	}
	#legend .staff:after {
		content: "Staff/Enlisted";
	}
    </style>
</head>

<body id="tpl{$templateName|ucfirst}">
{include file='header' title='Clan Structure'|language paddingBottom=30 light=true}

<div class="container" style="width:98%;">
  <div>
    <!--<span id="expandAll">Expand</span>
    <span id="collapseAll">Collapse</span>
    <span id="findMe">Find Me</span>-->
  </div>
  <div id="orgChart" style="height:530px;"></div>
  <div id="userIDs" style="display:none;"></div>
  <div id="legend">
    <div>Legend</div>
    <span class="upper-command"></span>
    <span class="command-advisor"></span>
    <span class="jcs"></span>
    <span class="joint-staff"></span>
    <span class="nco"></span>
    <span class="staff"></span>
  </div>
</div>



<script type="text/javascript">
	//var key = "1ytLulsBem8dt4tu9abbXrcuZIYnd6WXuuJTeTHyaYP8";
	//var jsonUrl = "https://spreadsheets.google.com/feeds/list/"+key+"/od6/public/basic?alt=json";
	//var xmlUrl = "https://spreadsheets.google.com/feeds/list/"+key+"/od6/public/values";
	
	var localJsonUrl = "./../wcf/js/3rdParty/getorgchart/json.txt";
	
	$.getJSON(localJsonUrl, function(data) {
	  //console.log(data);
	
	  var entry = data.feed.entry;
	  var jsonData = new Array();
	  
	  for (var i=0; i < entry.length; i++) {
	  	var entryData = new Object();
	  	
		//console.log(entry[i]['content']);
	  	
	  	var split = entry[i]['content']['$t'].split(",");
	  	for (var j=0; j < split.length; j++) {
	  		var entryItem = split[j].split(":");
	  		entryData[entryItem[0].trim()] = entryItem[1].trim();
	  	}
	  	entryData['id'] = entry[i]['title']['$t'];
	  	entryData['userIDs'] = entry[i]['content']['userIDs'];
	  	
	  	jsonData.push(entryData);
	  }
	  
	  //console.log(jsonData);
	  
	  dataSource = new Array();
	  for (var i=0; i < jsonData.length; i++) {
	  	var color = "neutralgrey";
	  	
	  	if ( jsonData[i]['unittypeprimary'] && jsonData[i]['unittypeprimary'].indexOf("NCO") !== -1 || 
	  	     jsonData[i]['unittypesecondary'] && jsonData[i]['unittypesecondary'].indexOf("NCO") !== -1) {
	  		var color = "lightblue";
	  	}
	  	
	  	if ( jsonData[i]['unittypeprimary'] && jsonData[i]['unittypeprimary'].indexOf("Joint Staff") !== -1 || 
	  	     jsonData[i]['unittypesecondary'] && jsonData[i]['unittypesecondary'].indexOf("Joint Staff") !== -1) {
	  		var color = "green";
	  	}
	  	
	  	if ( jsonData[i]['unittypeprimary'] && jsonData[i]['unittypeprimary'].indexOf("JCS") !== -1 || 
	  	     jsonData[i]['unittypesecondary'] && jsonData[i]['unittypesecondary'].indexOf("JCS") !== -1) {
	  		var color = "blue";
	  	}
	  	
	  	if ( jsonData[i]['unittypeprimary'] && jsonData[i]['unittypeprimary'].indexOf("Command Advisor") !== -1 || 
	  	     jsonData[i]['unittypesecondary'] && jsonData[i]['unittypesecondary'].indexOf("Command Advisor") !== -1) {
	  		var color = "darkorange";
	  	}
	  
	  	if ( jsonData[i]['unittypeprimary'] && jsonData[i]['unittypeprimary'].indexOf("Upper Command") !== -1 || 
	  	     jsonData[i]['unittypesecondary'] && jsonData[i]['unittypesecondary'].indexOf("Upper Command") !== -1) {
	  		var color = "darkred";
	  	}
	  
	  	dataSource.push({
	  	  'id'			: jsonData[i]['id'],
	  	  'parentId'		: jsonData[i]['parentid'],
	  	  'PositionName'		: jsonData[i]['positionname'],
	  	  'PositionImage'	: jsonData[i]['positionimage'],
	  	  'MemberName'		: "-",
	  	  'MemberLink'		: "",
	  	  'userid'		: jsonData[i]['memberforumsid'],
	  	  'ExpectedRank'	: jsonData[i]['expectedrank'],
	  	  'ExpectedRankImage'	: jsonData[i]['expectedrankimage'],
	  	  'UnitTypePrimary'	: jsonData[i]['unittypeprimary'],
	  	  'UnitTypeSecondary'	: jsonData[i]['unittypesecondary'],
	  	  'userIDs'		: jsonData[i]['userIDs'],
	  	  'color'		: color
	  	});
	  }
	  
	  customize = new Object();
	  for (var i=0; i < dataSource.length; i++) {
	  	customize[dataSource[i]["id"]] = {
	  		color: dataSource[i]["color"]
	  	}
	  }
	  
	  $.extend( getOrgChart.themes.cassandra, {
		size: [600, 200],
		textPoints: [{
		    x: 5,
		    y: 55,
		    width: 595,
		    height: 200
		}/*, {
		    x: 200,
		    y: 120,
		    width: 400
		}, {
		    x: 462,
		    y: 225,
		    width: 200
		}, {
		    x: 85,
		    y: 225,
		    width: 400
		}, {
		    x: 85,
		    y: 200,
		    width: 200
		}*/],
		//box: '<path class="get-box get-cassandra-border" d="M70 55 L70 0 L600 0 L600 55 M600 185 L600 240 L70 240 L70 185"/>',
		//box: '<path class="get-box get-cassandra-border" d="M0 0 L0 0 L600 0 L600 0 M600 200 L600 200 L0 200 L0 200"/>',
		box: '<rect class="get-box get-cassandra-border" height="200" width="600" />',
		text: '<text width="[width]" height="[height]" class="get-text get-cassandra-text get-text-[index]" x="[x]" y="[y]">[text]</text>',
		image: '<image xlink:href="[href]" x="425" y="60" height="170" preserveAspectRatio="xMaxYMax meet" width="170"></image>',
		logo:  '<image xlink:href="[href]" class="logo-image" x="505" y="115" height="80" preserveAspectRatio="xMidYMax meet" width="80" style="display:none;"></image>'
	});
	
	var orgChart = new getOrgChart(document.getElementById("orgChart"), {
            //theme: "annabel", //possible
	    //theme: "sara", //no
	    //theme: "belinda", //no
	    theme: "cassandra", //possible
	    //theme: "deborah", //no
	    //theme: "lena", //no
	    //theme: "monica", //no
	    //theme: "ula", //
	    //theme: "eve", //
	    //theme: "tal", //
	    //theme: "vivian", //
	    //theme: "ada", //
	    //theme: "helen", //
	    color: "neutralgrey",
            primaryFields: ["PositionName", "MemberName", "ExpectedRank", "UnitTypePrimary", "UnitTypeSecondary", "User I Ds" ],
            //primaryFields: ["PositionName" ],
            photoFields: ["PositionImage"],
            logoFields: ["ExpectedRankImage"],
            renderNodeEvent: renderNodeEvent,
            clickNodeEvent: clickNodeEvent,
            gridView: false,
            //orientation: getOrgChart.RO_TOP,
	    //orientation: getOrgChart.RO_BOTTOM,
	    //orientation: getOrgChart.RO_RIGHT,
	    //orientation: getOrgChart.RO_LEFT,
	    orientation: getOrgChart.RO_TOP_PARENT_LEFT,
	    //orientation: getOrgChart.RO_BOTTOM_PARENT_LEFT,
	    //orientation: getOrgChart.RO_RIGHT_PARENT_TOP,
	    //orientation: getOrgChart.RO_LEFT_PARENT_TOP,
            enableEdit: false,
            enableSearch: true,
            //HIGHLIGHT_SCALE_FACTOR: 0.2,
            scale: "auto",
            //scale: 0.3,
            enableDetailsView: false,
            expandToLevel: 12,
            subtreeSeparation: 300,
            levelSeparation: 250,
            linkType: "M",
            dataSource: dataSource,
            customize: customize
          });
	});
	
	//console.log(orgChart);
	
        function renderNodeEvent(sender, args) {
		//args.content[2] = args.content[2].replace("Amber McKenzie", "The name has been replaced");
		//args.content[5] = "<image xlink:href=\""+args.content[5]+"\" x=\"150\" y=\"1\" height=\"80\" preserveAspectRatio=\"xMidYMid slice\" width=\"80\"/>"; 
		
		var isLeaf = args.node.data.UnitTypeSecondary;
		if (isLeaf) {
			isLeaf = (args.node.data.UnitTypeSecondary.split("|")[0] == "leaf") ? true : false;
		}
		//console.log("leaf is " + isLeaf);
		
		var target = args.content[3];
		var userid = args.node.data.userid;
		if(userid && !isLeaf) {
			//console.log("not a leaf, userid is " + userid);
			getUserDetails(userid, false, sender, args);
		}
		
		if (isLeaf) {
			var staffids = args.node.data.UnitTypeSecondary.split("|");
			//console.log("is a leaf, staffids are " + staffids);
			if(staffids.length > 1) {
				for(var i=1; i<staffids.length; i++) {
					getUserDetails(staffids[i], true, sender, args);
				}
			}
		}
		
		var color = args.node.data.color;
		args.content[1] = args.content[1].replace("get-box", "get-box get-"+color);
		//args.content[1] = args.content[1].replace("d=", "fill=\""+color+"\" d=");
		
		/*args.content[2] = args.content[2].replace("<text", "<rect class=\"shape\" height=\"200\" width=\"395\" y=\"55\" x=\"5\"></rect><text");
		args.content[2] = args.content[2].replace("get-text", "get-text wrap");
		args.content[2] = args.content[2].replace("<text", "<text id=\""+args.node.id+"\" ");
        	
        	//console.log("after");
        	//console.log(args);
        	
        	d3plus.textwrap().container(d3.select("#"+args.node.id)).draw();*/
	}
	
	function clickNodeEvent(sender, args) {
		//console.log(sender);
		//console.log(args);
		//sender.highlightNode(args.node.id);
		sender.showDetailsView(args.node.id);
		
		var isLeaf = args.node.data.UnitTypeSecondary;
		if (isLeaf) {
			isLeaf = (args.node.data.UnitTypeSecondary.split("|")[0] == "leaf") ? true : false;
		}
		if (isLeaf) {
			$(".unit-type").each(function() {
				var link = $('#userIDs').attr("l-"+$(this).attr('data-item'));
				var name = $('#userIDs').attr("u-"+$(this).attr('data-item'));
				$(this).html("<a href='"+link+"' target='_blank'>"+name+"</a>");
			});
		}
	}
	
	function getUserDetails(userid, multi, sender, args) {
		var params = {
		  userID: userid
		}
		
		if (multi === false) {
			var thisNode = $("g[data-node-id='"+args.node.id+"']").children();
			var title = $(thisNode[1]);
			var user = $(thisNode[2]);
			var expectedRankText = $(thisNode[3]);
			var group1 = $(thisNode[4]);
			var group2 = $(thisNode[5]);
			var expectedRankImage = $(thisNode[6]);
			
			user.html("<a href='"+args.node.data.userIDs[userid].link+"' target='_blank'>"+args.node.data.userIDs[userid].username+"</a>");
			
			args.node.data.MemberName = args.node.data.userIDs[userid].username;
			args.node.data.MemberLink = "<a href='"+args.node.data.userIDs[userid].link+"' target='_blank'>"+args.node.data.userIDs[userid].username+"</a>";
			
			var IDs = $('#userIDs');
			IDs.attr("u-"+userid, args.node.data.userIDs[userid].username); 
		}
		
		if (multi === true) {
			var IDs = $('#userIDs');
			IDs.attr("u-"+userid, args.node.data.userIDs[userid].username).attr("l-"+userid, args.node.data.userIDs[userid].link); 
			args.node.data.MemberList += (", " + args.node.data.userIDs[userid].username);
		}
	
		/*new WCF.Action.Proxy({
			autoSend: true,
			showLoadingOverlay: true,
			data: {
				parameters: params,
				actionName: 'getUserDetailsByUserID',
				className: 'wcf\\data\\structure\\StructureAction'
			},
			success: $.proxy(function(data, textStatus, jqXHR) {
				if (multi === false) {
					var thisNode = $("g[data-node-id='"+args.node.id+"']").children();
					var title = $(thisNode[1]);
					var user = $(thisNode[2]);
					var expectedRankText = $(thisNode[3]);
					var group1 = $(thisNode[4]);
					var group2 = $(thisNode[5]);
					var expectedRankImage = $(thisNode[6]);
					
					user.html("<a href='"+data.returnValues.link+"' target='_blank'>"+data.returnValues.username+"</a>");
					
					args.node.data.MemberName = data.returnValues.username;
					args.node.data.MemberLink = "<a href='"+data.returnValues.link+"' target='_blank'>"+data.returnValues.username+"</a>";
					
					var IDs = $('#userIDs');
					IDs.attr("u-"+userid, data.returnValues.username); 
				}
				
				if (multi === true) {
					var IDs = $('#userIDs');
					IDs.attr("u-"+userid, data.returnValues.username).attr("l-"+userid, data.returnValues.link); 
					args.node.data.MemberList += (", " + data.returnValues.username);
				}
			}, this),
			failure: $.proxy(function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
				console.log(errorThrown);
			}, this)
		});*/
	}
	
	$('#findMe').click(function() {
		console.log('find me');
		console.log(orgChart);
	});
	
	/*$('#expandAll').click(function() {
		console.log('click expand');
		console.log(orgChart);
		for(var i in orgChart.nodes) {
			var tog = $( "circle[data-btn-id='"+i+"']" );
			console.log(tog);
		}
		
	});*/
</script>


{include file='footer' skipBreadcrumbs=true}
</body>
</html>