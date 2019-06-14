$(".student").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
  "student[name]":{
    required: true,
    maxlength: 20,
    minlength: 6
  }
  },
  messages: {
    name:{
      required: "name is required.",
      maxlength: "name must be less than 20",
      minlength: "name must be more than 6"
    }
  }
});