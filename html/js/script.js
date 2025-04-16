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
        
        // Update status bars (inverted percentage for fill from bottom)
        if (event.data.hunger !== undefined) {
            document.getElementById('hunger-fill').style.height = (100 - event.data.hunger) + '%';
        }
        if (event.data.thirst !== undefined) {
            document.getElementById('thirst-fill').style.height = (100 - event.data.thirst) + '%';
        }
    }
});

// Format number with dots as thousand separator (e.g., 50.800)
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

// Initial setup to ensure icons are visible
document.addEventListener('DOMContentLoaded', function() {
    // Set initial fill levels
    document.getElementById('hunger-fill').style.height = '30%';
    document.getElementById('thirst-fill').style.height = '40%';
});
