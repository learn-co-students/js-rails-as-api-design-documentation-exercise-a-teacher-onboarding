console.log("Logging from the index.js of the coffee app");
let page = 1;
const coffeeList = document.getElementById("coffee-list");
const nextButton = document.getElementById("next-results"); 
const filterButton = document.getElementById("filter");
let origin = "";

nextButton.addEventListener("click", (event) => {
  fetchCoffee(page, origin);
  page += 1;
});

filterButton.addEventListener("click", (event) => {
  event.preventDefault();
  if (event.target.parentElement.origin.value.toLowerCase() != origin) {
    page = 1;
    origin = event.target.parentElement.origin.value.toLowerCase();
  };
  fetchCoffee(page, origin);
  page += 1;
});


function fetchCoffee(page, origin) {
  coffeeList.innerHTML = "";
  let url = `http://localhost:3000/coffee_search?page=${page}&origin=${origin}`;
  fetch(url).then(
    response => response.json()
  ).then(
    json => appendCoffees(json)
  );
};

function appendCoffees(json) {
  console.log(json);
  json.forEach( coffee => {
    appendCoffee(coffee);
  });
};

function appendCoffee(coffee) {
  let liCoffee = document.createElement("li");
  let hName = document.createElement("h3");
  hName.innerText = coffee.blend_name;
  let pOrigin = document.createElement("p");
  pOrigin.innerText = coffee.origin;
  let pNotes = document.createElement("p");
  pNotes.innerText = coffee.notes;
  liCoffee.appendChild(hName);
  liCoffee.appendChild(pOrigin);
  liCoffee.appendChild(pNotes);
  coffeeList.appendChild(liCoffee);
};