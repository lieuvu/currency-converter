<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Noso Exchange Converter</title>
   <!-- Latest compiled and minified Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

  <!-- Latest compiled Boostrap -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  
</head>

<body>
  <div style="margin: auto; margin-top:100px; width: 75%;" id="main-container">
    <div class="jumbotron"  style="padding:40px; background-color: #cccc00;">
      <h1 style="font-size: 5rem; text-align: center;">NOSTO EXCHANGE CONVERTER</h1>
    </div>

    <div class="jumbotron" style="padding: 40px;">
      <!-- Money Exchange Form -->
      <form id="money-exchange-form" class="needs-validation">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group row justify-content-center">
            <!-- <input type="hidden" name="csrf-token" value="abc"/> -->
          <div class="col-2">
            <input required class="form-control" type="number" placeholder="Value" name="value" min="0">
          </div>
          <div class="col-4">
            <input required class="form-control" type="text" placeholder="Source Currency" name="source" pattern="[a-zA-Z]{3}" minlength="3" maxlength="3">
          </div>
          <div class="col-4">
            <input required class="form-control" type="text" placeholder="Target Currency" name="target" pattern="[a-zA-Z]{3}" minlength="3" maxlength="3">
          </div>
          <button class="col btn btn-default btn-primary" id="convert-btn">Convert</button>
        </div>
      </form>

      <!-- Result here-->
      <div class="row justify-content-center">
        <span style="display: none; margin-bottom: 0;" class="badge alert alert-danger" id="err-msg">Error Here</span>
        <span style="display: none; margin-bottom: 0;" class="badge alert alert-success" id="success-msg">Success Here</span>
      </div>
    </div>
  </div>

  <script>
  	/* $(function() {
  		// Hide messages
  		const $errEl = $('#err-msg');
  		const $successEl = $('#success-msg');
  		$errEl.hide();
  		$successEl.hide();
  		
  		$('#convert-btn').off().on('click', (ev) => {
  			// Disable button
  			$(ev.currentTarget).attr('disabled', true);
  			
  			// Hide messages
  	  		$errEl.hide();
  	  		$successEl.hide();
  	  		
  	  		// Get form element
  	  		const $form = $('#money-exchange-form');
  	  		// Loop over them and prevent submission
  	  	  	Array.prototype.slice.call($form)
  	  	    .forEach(function (form) {
  	  	      form.addEventListener('submit', function (event) {
  	  	        if (!form.checkValidity()) {
  	  	          event.preventDefault()
  	  	          event.stopPropagation()
  	  	        }

  	  	        form.classList.add('was-validated')
  	  	      }, false)
  	  	    })
  	  		  			
  			// Get data
  			const dataArr = $form.serializeArray();
  		    var data = {};
			
  		    dataArr.forEach((item) => {
  		    	data[item.name] = item.value.trim();
  		    });  		
  		    
  		  	var token = $("meta[name='_csrf']").attr("content");
  			var header = $("meta[name='_csrf_header']").attr("content");
  		 	
  			$.ajax({
  				method: 'POST',
  				url: '/api/convert',
  				data: JSON.stringify(data),
  				contentType: 'application/json;charset=utf-8',
  				dataType: 'json',
  				headers: {
  			        'X-CSRF-TOKEN':token,  			        
  			    },
  				success: (res) => {
  				// Get response and display
  		          const {value, localize, currency} = res;
  		          $successEl.text(Intl.NumberFormat(localize, {style: 'currency', currency: currency}).format(value));
  		          $successEl.show();
  				},
  				error: ($xhr, status, err) => {
  					// Show error message
  					let errMsg = '';
  					const {error, errors} = $xhr.responseJSON;
  					if (errors && errors[0].defaultMessage) {
  						errMsg = errors[0].defaultMessage;
  					} else {
  						errMsg = error;
  					}
  					$errEl.text(errMsg);
  					$errEl.show();
  				},
  				complete: () => {
  					// Enable button
  					$(ev.currentTarget).removeAttr('disabled');
  				}
  			})
  		})
  	}) */
 // Example starter JavaScript for disabling form submissions if there are invalid fields
  	(function() {
  	  'use strict';
  	  window.addEventListener('load', function() {
  	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
  	    var forms = document.getElementsByClassName('needs-validation');
  	    // Loop over them and prevent submission
  	    var validation = Array.prototype.filter.call(forms, function(form) {
  	      form.addEventListener('submit', function(event) {
  	        if (form.checkValidity() === false) {
  	          event.preventDefault();
  	          event.stopPropagation();
  	        }
  	        form.classList.add('was-validated');
  	      }, false);
  	    });
  	  }, false);
  	})();
  </script>
</body>
</html>
