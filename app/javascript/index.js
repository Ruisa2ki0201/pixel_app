window.addEventListener('load', function(){
  const Lists = document.querySelectorAll(".list")
  const Image = document.querySelector(".main-image")
  const Image2 = document.querySelector(".main-image2")

  Lists.forEach(function(list){
    list.addEventListener('mouseover', function(){
      list.setAttribute("style", "color: #33FF66")
    })
    list.addEventListener('mouseout', function(){
      list.removeAttribute("style", "color: #33FF66")
    })
  })

  Image.addEventListener('click', function(){
    if (Image.getAttribute("style") == "background-image: url(https://cdn.pixabay.com/photo/2020/03/01/15/30/fox-4893199_1280.jpg);") {
      Image.removeAttribute("style", "background-image: url(https://cdn.pixabay.com/photo/2020/03/01/15/30/fox-4893199_1280.jpg);")
    } else {
      Image.setAttribute("style","background-image: url(https://cdn.pixabay.com/photo/2020/03/01/15/30/fox-4893199_1280.jpg);")
    }
  })

  Image2.addEventListener('click',function(){
    if (Image2.getAttribute("style") == "background-image: url(https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg);") {
      Image2.removeAttribute("style", "background-image: url(https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg);")
    } else {
      Image2.setAttribute("style", "background-image: url(https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg);")
    }
  })
})