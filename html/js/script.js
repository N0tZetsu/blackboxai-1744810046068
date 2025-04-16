window.addEventListener('message', function(event) {
    if (event.data.type === "updateHUD") {
        // Update money values with thousand separator
        if (event.data.money !== undefined) {
            document.getElementById('money').textContent = formatNumber(event.data.money);
        }
        if (event.data.bank !== undefined) {
            document.getElementById('bank').textContent = formatNumber(event.data.bank);
        }
        if (event.data.id !== undefined) {
            document.getElementById('id').textContent = event.data.id;
        }
        
        // Update status bars
        if (event.data.hunger !== undefined) {
            document.getElementById('hunger-overlay').style.height = (100 - event.data.hunger) + '%';
        }
        if (event.data.thirst !== undefined) {
            document.getElementById('thirst-overlay').style.height = (100 - event.data.thirst) + '%';
        }
    }
});

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
