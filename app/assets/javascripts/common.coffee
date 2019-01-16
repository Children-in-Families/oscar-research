OSCAR.Common =
  init: ->
    @initNotification()

  initNotification: ->
    messageOption = {
      "closeButton": true,
      "debug": true,
      "progressBar": true,
      "positionClass": "toast-top-center",
      "showDuration": "100",
      "hideDuration": "500",
      "timeOut": "3000",
      "extendedTimeOut": "500",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
    messageInfo = $("#wrapper").data()
    if Object.keys(messageInfo).length > 0
      if messageInfo.messageType == 'notice'
        toastr.success(messageInfo.message, '', messageOption)
        debugger
      else if messageInfo.messageType == 'alert'
        toastr.error(messageInfo.message, '', messageOption)
        debugger
