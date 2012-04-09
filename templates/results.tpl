<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/styles/bootstrap.css" type="text/css">
<style>

body { padding-top: 60px; }
.orange { color: #F7A900; }

.results a { color: #F7A900; }

.navbar h2 a { color: #ffffff; }
.navbar-form { margin-top: 10px; }


.navbar-inner {
  background-color: #686868;
  background-image: -moz-linear-gradient(top, #686868, #333333);
  background-image: -ms-linear-gradient(top, #686868, #333333);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#686868), to(#333333));
  background-image: -webkit-linear-gradient(top, #686868, #333333);
  background-image: -o-linear-gradient(top, #686868, #333333);
  background-image: linear-gradient(top, #686868, #333333);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#686868', endColorstr='#333333', GradientType=0);
}

#fixed { width: 470px; }


</style>
<link rel="stylesheet" href="/styles/bootstrap-responsive.css" type="text/css">
<title>DaveDaveFind: {{ search_query }}</title>
</head>
<body>
<div class="navbar navbar-fixed-top">
<div class="navbar-inner">
<div class="container">
		<span class="brand">
		<h2><a href="/">DaveDave<strong class="orange">Find</strong></a></h2></span>
		<form class="navbar-form form-inline" action="/search" method="GET" >
  				<input type="text" name="search_query" class="input-xlarge">
  				<button type="submit" class="btn btn-warning"><i class="icon-search icon-white"></i></button>
		</form>
</div>
</div>
</div>

<div class="container">
		<div class="row">
			<div class="span6">
		<h2>You searched for: <strong class="orange">{{ search_query }}</strong></h2>
		%if not results:
			<p>No results found for {{ search_query }}.<p>
		%end
			</div>
		</div>
		<div class="row">
		<div class="span5" id="fixed">
			%if video_dicts:
				<div>
				<h2>Videos:</h2>
				%for video in video_dicts:
				<div class="results well">
				<strong>{{ video['title'] }}</strong>
				<p><a href="{{ video['url'] }}">{{ video['url'][:70] }}</a></p>	
				<iframe width="430" height="248" src="http://www.youtube.com/embed/{{ video['id'] }}?rel=0&start={{ video['start'] }}&wmode=transparent" frameborder="0" allowfullscreen></iframe>			
				</div>
				%end
				</div>
			</div>
			<div class="span7">
			%if page_dicts:
				<div>
				<h2>Webpages:</h2>
				%for page in page_dicts:
				<div class="results well">
				<strong>{{ page['title'] }}</strong>
				<p><a href="{{ page['url'] }}">{{ page['url'][:70] }}</a></p>
					%if show_daverank:
					<p>DaveRank: {{ page['daverank'] }}</p>
					%end
				<p>{{ page['text'] }}</p>				
				</div>
				%end
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>