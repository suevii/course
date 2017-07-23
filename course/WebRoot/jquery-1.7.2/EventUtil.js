/**
 * Created by hsx67 on 2017/4/24.
 */
// 跨浏览器的事件对象
var EventUtil = {
    addHandler : function (element,type,handler) {
        if(element.addEventListener){
            element.addEventListener(type,handler,false);
        }else if(element.attachEvent){
            element.attachEvent(type,handler);
        }else {
            element["on"+type] = handler;
        }
    },
    removeHandler : function (element,type,handler) {
        if(element.removeEventListener){
            element.removeEventListener(type,handler);
        }else if(element.detachEvent){
            element.detach(type,handler);
        }else {
            element["on"+type] = null;
        }
    },
    getEvent : function (event) {
        return event ? event : window.event;
    },
    getTarget : function (event) {
        return event.target || event.srcElement;
    },
    preventDefault : function (event) {
        if(event.preventDefault){
            event.prevenDefault();
        }else {
            event.returnValue = false;
        }
    },
    stopPropagation : function (event) {
        if(event.stopPropagation){
            event.stopPropagation();
        }else {
            event.cancelBubble = true;
        }
    },
    getClipboardText : function (event) {
        var clipboardData = (event.clipboardData || window.clipboardData);
        return clipboardData.getData("text");
    },
    setClipboardText : function (event,value) {
        if(event.clipboardData){
            return event.clipboardData.setData("text/plain",value);
        }else if(window.clipboardData){
            return window.clipboardData.setData("text",value);
        }
    }
}