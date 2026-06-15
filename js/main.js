const yearElements = document.querySelectorAll("[data-year]");
const currentYear = new Date().getFullYear();

yearElements.forEach((element) => {
  element.textContent = currentYear;
});
