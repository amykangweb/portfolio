$(document).ready(function(){

// http://christopheviau.com/d3_tutorial/
// http://jsfiddle.net/kevintcoughlin/JV62X/light/

  var width = window.innerWidth;
  var height = window.innerHeight;

   var nodes = d3.range(1000).map(function () { return {
      radius: Math.random() * 12 + 4,
      cx: Math.random() * width,
      cy: Math.random() * height }
   });

  var sampleSVG = d3.select("#viz")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

// Append each circle in nodes to SVG
for (var i = 0; i < nodes.length; i++) {
    sampleSVG.append("circle")
    .attr("cx", nodes[i].cx)
    .attr("cy", nodes[i].cy)
    .attr("r", nodes[i].radius)
    .attr("fill", "#3F3F3D")
    .attr("stroke", "#2A2A27")
    .attr("stroke-width", 5)
    .on("mouseover", animateFirstStep);
}

function animateFirstStep() {
  d3.select(this)
    .transition()
    .delay(0)
    .duration(1000)
    .style("opacity", 0.5)
    .attr("cx", Math.random() * width)
    .attr("cy", Math.random() * height)
    .each("end", animateSecondStep);
};

function animateSecondStep() {
  d3.select(this)
    .transition()
      .duration(1000)
      .style("opacity", 1)
      .attr("cx", Math.random() * width)
      .attr("cy", Math.random() * height);
};


});
