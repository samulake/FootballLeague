function changeFieldBackground(element) {
	distinguish(element, "orange", "yellow");
}

function restoreDefaults(element) {
	distinguish(element, "black", "white");
}

function distinguish(element, labelTextColor, textFieldBackgroundColor) {
	element.style.backgroundColor = textFieldBackgroundColor;
	element.parentElement.previousElementSibling.style.color = labelTextColor;
	var rows = document.getElementsByTagName("tr");
	var i;
	var element = document.createElement("td");

	for(i = 0; i < rows.length; i++) {
		//rows.appendChild(newNode)
	}
}