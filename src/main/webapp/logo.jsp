<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>	

<div style="margin-bottom:-25px;">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top:-20px;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="${job}/images/logo3.jpg" alt="在正确的时刻，遇到合适的工作" >
      <div class="carousel-caption">
      	在正确的时刻，遇到合适的工作
      </div>
    </div>
    
    <div class="item">
      <img src="${job}/images/logo2.jpg" alt="在正确的时刻，遇到合适的工作">
      <div class="carousel-caption">
                 在正确的时刻，遇到合适的工作
      </div>
    </div>
    
    <div class="item">
      <img src="${job}/images/logo1.png" alt="在正确的时刻，遇到合适的工作" >
      <div class="carousel-caption">
                在正确的时刻，遇到合适的工作
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class=" carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="margin-left:1050px;">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>