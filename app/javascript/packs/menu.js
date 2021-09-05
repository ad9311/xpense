function* toggle() {
  const menu = document.getElementById('menu');
  while (true) {
    menu.classList += ' menu-show';
    yield 1
    menu.classList = 'menu';
    yield 0
  }
}

const ham = document.getElementById('ham');
const gen = toggle();
ham.addEventListener('click', () => gen.next());
