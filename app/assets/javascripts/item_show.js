$(function(){
const thumbs = document.querySelectorAll('.thumb');
  thumbs.forEach(function(item,index) {
    item.onclick = function(){
      console.log(this)
      document.getElementById('bigimg').src = this.src;
    }
  });
});