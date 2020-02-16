let name;
let plot;
let all_first_names = [];
let female_first_names = [];
let male_first_names = [];
let last_names = [];
let plot_button = document.getElementById("plot-button");
let plot_space = document.getElementById("plot-result");
let name_button = document.getElementById("name-button");
let name_space = document.getElementById("name-result");

const fetchFirstNames = () => {
  return fetch('https://health.data.ny.gov/resource/jxy9-yhdk.json')
    .then(response => response.json())
    .then(names => all_first_names = names)
}

const fetchLastNames = () => {
  return fetch('https://api.census.gov/data/2010/surname?get=NAME&RANK=1:1000')
    .then(response => response.json())
    .then(names => last_names = names.slice(1));
}

const sortFirstNames = () => {
  all_first_names.forEach(function(name) {
    if(name["sex"] === "M") {
      male_first_names.push(name["first_name"])
    } else if(name["sex"] === "F") {
      female_first_names.push(name["first_name"])
    }
  })
}

const generateName = () => {
  let female_name_index = Math.floor(Math.random() * (female_first_names.length));
  let male_name_index = Math.floor(Math.random() * (male_first_names.length));
  let last_name_index = Math.floor(Math.random() * (last_names.length));
  let radio_button =  document.querySelector('input[name="gender"]:checked');

  if(radio_button.value === "male") {
    first = properly_capitalize(male_first_names[male_name_index])
  } else if(radio_button.value === "female") {
    first = properly_capitalize(female_first_names[female_name_index])
  };
  last = properly_capitalize(last_names[last_name_index][0]);
  name = first + " " + last;
}

const properly_capitalize = (name) => {
  return name[0] + name.slice(1).toLowerCase()
}

const getPlot = () => {
  // on local:
  // return fetch('http://localhost:9393/generate_plot')
  return fetch('https://novel-concepts.herokuapp.com/generate_plot')
  .then(response => response.text()).
  then(resp => plot = resp)
}

const listeners = () => {
  if (plot_button) {
    plot_button.addEventListener("click", handlePlot);
  };
  if (name_button) {
    name_button.addEventListener("click", handleName);
  };
}

const displayPlotText = () => {
  plot_space.textContent = `${plot}`
}

const displayNameText = () => {
  name_space.textContent = `Meet your new character: ${name}`
}

const handleName = () => {
  generateName();
  displayNameText();
}

const handlePlot = async () => {
  await getPlot();
  displayPlotText()
}

const gatherNames = async () => {
  await fetchFirstNames();
  await fetchLastNames();
  sortFirstNames();
}


listeners()
gatherNames()
