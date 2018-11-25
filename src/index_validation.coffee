###
# File: index_validation.coffee
# Author: James Kuczyznski
# File Description: Dynamic validation for user input in the index.html web page.
#
# Last Modified: 11/24/2018
###

# Wait for the DOM to be ready
$ ->
    # Initialize form validation on the registration form.
    $('form[name=\'start\']').validate
        # Specify validation rules
        rules: room_number:
            required: true
            number: true
      
        # Specify validation error messages
        messages: room_number:
            required: 'Please enter your start room number'
            number: 'Only digits [0-9] allowed'
        
        #  Make sure the form is submitted to the destination defined
        submitHandler: (form) ->
            form.submit()
            return
    return


# Wait for the DOM to be ready
$ ->
    # Initialize form validation on the registration form.
    $('form[name=\'goal\']').validate
        # Specify validation rules
        rules: room_number:
            required: true
            number: true
        
        # Specify validation error messages
        messages: room_number:
            required: 'Please enter your goal room number'
            number: 'Only digits [0-9] allowed'
        
        # Make sure the form is submitted to the destination defined
        submitHandler: (form) ->
            form.submit()
            return
    return
