$(".school").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "school[name]":{
    required: true,
    maxlength: 20,
    minlength: 6
  },
  "school[email]": {
    email: true
  }

  // email is required with format
  
  },
  // error messages
  messages: {
    name:{
      required: "name is required.",
      maxlength: "name must be less than 20",
      minlength: "name must be more than 6"
    },
    email: {
      required: "This Field is Required"
    }
  }
});