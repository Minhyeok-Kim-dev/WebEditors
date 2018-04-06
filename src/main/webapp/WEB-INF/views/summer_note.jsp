<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
		
		<!-- include summernote css/js -->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>SummerNote Editor</title>
	</head>
	<body>
		<form id="form" method="post">
			<input type="hidden" id="contents" />
			<div id="summernote"></div>
			<input type="button" id="btnSubmit" value="전송" />
		</form>
		
		<script>
			function getContextPath() {
			   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
			}
		
			$(document).ready(function(){
				$("#btnSubmit").on("click", function(){
					$("#contents").val($("#summernote").summernote('code'));
					
					$.ajax(getContextPath() + "/summerNote", {
						type : "post",
						dataType : "json",
						data : {
							contents : $("#contents").val()
						}
					})
					.done(function(data) {	// success 시
					})
					.fail(function(data) {
						alert("loadLogs failed");
					});
				});
				
				
				
				let HelloButton = function(context) {
					let ui = $.summernote.ui;
					
					// create button
					let button = ui.button({
						contents: '<i class="fa fa-child"/> Hello',
						tooltip: 'hello',
						click: function () {
					      // invoke insertText method with 'hello' on editor module.
					      context.invoke('editor.insertText', 'hello');
					    }
					  });
					
					return button.render();
				}
				
				$("#summernote").summernote({
					toolbar:[
						['insert', ['picture', 'link', 'video', 'table', 'hr']],
						['style', ['bold', 'italic', 'underline', 'clear']],
						['font', ['fontname', 'fontsize', 'color', 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
						['paragraph', ['style', 'ol', 'ul', 'paragraph', 'height']],
						["misc", ['fullscreen', 'codeview', 'undo', 'redo', 'help']],
						['mybutton',['hello']]
					],

					buttons:{
						hello:HelloButton
					},
					
					popover:{
						air:[
							['color', ['color']],
							['font', ['bold', 'underline', 'clear']]
						],
						table:[
					        ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
					        ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]
					      ]
					},
					
					//airMode:true,
					
					placeholder: 'write here...',
					
					fontNames:['Arial', 'Arial Black', 'Comic Sans MS'],
					fontNamesIgnoreCheck:['Arial'],
					
					dialogsInBody:true,
					dialogsFade:true,
					
					disableDragAndDrop:true,
					
					shortcuts:false,
					
					prettifyHtml:true,
					
					codemirror: { // codemirror options
						mode:'text/html',
					    htmlMode:true,
					    lineNumbers:true,
					    theme:'monokai',
					    width:'100px',
					    textWrapping:true
					}
					 
				});
				
				$('#summernote').summernote('insertText', '');
				
				/*
				$('#summernote').summernote('reset');
				
				$('#summernote').summernote('focus');
				
				 
				if ($('#summernote').summernote('isEmpty')) {
					  alert('editor content is empty');
				}
				 
				 
				$('#summernote').summernote('disable');
				$('#summernote').summernote('enable');
				
				$('#summernote').summernote('bold');
				$('#summernote').summernote('italic');
				$('#summernote').summernote('underline');
				$('#summernote').summernote('strikethrough');
				$('#summernote').summernote('removefFormat');
				
				$('#summernote').summernote('insertParagraph');
				
				$('#summernote').summernote('insertOrderedList');

				$('#summernote').summernote('indent');
				$('#summernote').summernote('outdent');
				*/
			});
		</script>
	</body>
</html>