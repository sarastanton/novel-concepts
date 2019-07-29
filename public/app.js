let name;
let plot;
let plot_button = document.getElementById("plot-button");
let plot_space = document.getElementById("plot-result");
let name_button = document.getElementById("name-button");
let name_space = document.getElementById("name-result");


function getName() {
  fetch(`https://health.data.ny.gov/resource/jxy9-yhdk.json`).then(response => console.log(response));
}

async function getPlot() {
  fetch('http://127.0.0.1:9393/generate_plot')
  .then(response => response.text())
  .then(response_text => plot = response_text)
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
  displayName();
}

function handlePlot() {
 getPlot();
 debugger
  displayPlotText();
}

function displayPlotText() {
  name_space.textContent = `${plot}`
}

function displayNameText() {
  plot_space.textContent = `Meet your new character: ${name[0]} ${name[1]}`
}



listeners()
