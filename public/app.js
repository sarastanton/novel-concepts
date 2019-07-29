let name;
let plot;
let plot_button = document.getElementById("plot-button");
let plot_space = document.getElementById("plot-result");
let name_button = document.getElementById("name-button");
let name_space = document.getElementById("name-result");


function getName() {
  fetch(`https://health.data.ny.gov/resource/jxy9-yhdk.json`)
  .then(response => response.text())
  .then(resp => name = resp)
}

 function getPlot() {
  fetch('http://127.0.0.1:9393/generate_plot')
  .then(response => response.text()).
  then(resp => plot = resp)
}

function listeners() {
  if (plot_button) {
    plot_button.addEventListener("click", handlePlot);
  }
  if (name_button) {
    name_button.addEventListener("click", handleName);
  }
}

function handleName() {
  getName()
  displayNameText();
}

async function handlePlot() {
  getPlot()
  displayPlotText()
}

function displayPlotText() {
  plot_space.textContent = `${plot}`
}

function displayNameText() {
  name_space.textContent = `Meet your new character: ${name}`
}



listeners()
