(function(skuid){
skuid.snippet.register('newSnippet',function(args) {var field = arguments[0],
value = arguments[1];
if (field.mode == 'read') {
skuid.ui.fieldRenderers.INTEGER.read(field,value);
} else if (field.mode == 'edit') {
// Render a jQuery ui slider
// with step size 1 and boundary range [0,10].
// Whenever this slider is updated,
// our row will be updated as well
var slider = $j('<div>').slider({
value:value || 0,
min: 0,
max: 10,
step: 1,
slide: function( event, ui ) {
// Update our model with the new value
field.model.updateRow(
field.row,
field.id,
ui.value,
{ initiatorId : field._GUID}
);
}
});
field.element.append(slider);
}
});
}(window.skuid));