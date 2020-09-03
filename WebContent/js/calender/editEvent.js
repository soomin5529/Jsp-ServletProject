/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');


};
