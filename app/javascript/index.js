window.addEventListener('load', function(){
  const Lists = document.querySelectorAll(".list")

  Lists.forEach(function(list){
    list.addEventListener('mouseover', function(){
      list.setAttribute("style", "color: #33FF66")
    })
    list.addEventListener('mouseout', function(){
      list.removeAttribute("style", "color: #33FF66")
    })
  })
})