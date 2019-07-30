let name;
let plot;
let plot_button = document.getElementById("plot-button");
let plot_space = document.getElementById("plot-result");
let name_button = document.getElementById("name-button");
let name_space = document.getElementById("name-result");


function getName() {
  let radio_button =  document.querySelector('input[name="gender"]:checked');
  if(radio_button.value === "female") {
    return fetch('http://127.0.0.1:9393/generate_female_name')
    // return fetch(' https://novel-concepts.herokuapp.com/generate_female_name')
    .then(response => response.text())
    .then(resp => name = resp)
  } else if(radio_button.value === "male") {
    return fetch('http://127.0.0.1:9393/generate_male_name')
    // return fetch(' https://novel-concepts.herokuapp.com/generate_male_name')
    .then(response => response.text())
    .then(resp => name = resp)
  };
  return name
}

 function getPlot() {
  return fetch('http://127.0.0.1:9393/generate_plot')
  // return fetch('https://novel-concepts.herokuapp.com/generate_plot')
  .then(response => response.text()).
  then(resp => plot = resp)
}

function listeners() {
  if (plot_button) {
    plot_button.addEventListener("click", handlePlot);
  };
  if (name_button) {
    name_button.addEventListener("click", handleName);
  };
}

async function handleName() {
  await getName();
  displayNameText();
}

async function handlePlot() {
  await getPlot();
  displayPlotText()
}

function displayPlotText() {
  plot_space.textContent = `${plot}`
}

function displayNameText() {
  name_space.textContent = `Meet your new character: ${name}`
}



listeners()
