const inputs = document.querySelectorAll("input"),
    button = document.querySelector("button");
const validKeys = ['0','1','2','3','4','5','6','7','8','9','Backspace'];
inputs.forEach((input, index1) => {
    input.addEventListener("keyup", (e) => {
        const currentInput = input,
        nextInput = input.nextElementSibling,
        prevInput = input.previousElementSibling;
        if(validKeys.includes(e.key)){
            if(e.key != 'Backspace' && index1 < 5){
                nextInput.focus();
            }
            else if(e.key == 'Backspace' && index1 > 0){
                prevInput.focus();
            }
            else if(e.key == 'Backspace' && index1 == 0){
                currentInput.focus();
            }
        }
        else{
            currentInput.value = '';
            currentInput.focus();
        }        
    });
});