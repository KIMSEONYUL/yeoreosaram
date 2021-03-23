<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String title = request.getParameter("title");%>
<%@ page import="java.util.*" %>
<%
   boolean bool[] = new boolean[10];
   for(int i=0; i<=10; i++) {
      
   }
%>
<%
   String pStart = request.getParameter("pStart");
   String pEnd = request.getParameter("pEnd");
   int pStart1 = Integer.parseInt(pStart);
   int pEnd1 = Integer.parseInt(pEnd);
   int i;
%>
<!DOCTYPE html>
<html>
    <%@ include file="/WEB-INF/views/include/head.jsp" %> 
    <title>일정만들기</title>

<!-- join CSS link -->
<link href="/resources/css/joinStyle.css" rel="stylesheet">

<!-- ======= Navbar ======= -->
<%@ include file="/WEB-INF/views/include/teamNavigation2.jsp" %>

<body>   
<!-- 장소 키워드/검색 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:130%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="인천" id="keyword" size="15"> 
                       <button id="btn1" type="submit">검색하기</button>
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>


<!-- KAKAO api key 입력 --> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f971e17e00ae485ab7a78301e95a6fe8&libraries=services"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
   // 마커를 담을 배열입니다
   var markers = [];
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 5 // 지도의 확대 레벨
       };  
   
   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 
   
   // 장소 검색 객체를 생성합니다
   var ps = new kakao.maps.services.Places();  
   
   // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({zIndex:1});
   
   // 키워드로 장소를 검색합니다
   searchPlaces();
   
   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces() {
   
       var keyword = document.getElementById('keyword').value;
   
       if (!keyword.replace(/^\s+|\s+$/g, '')) {
           alert('키워드를 입력해주세요!');
           return false;
       }
   
       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
       ps.keywordSearch( keyword, placesSearchCB); 
   }
   
   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {
       if (status === kakao.maps.services.Status.OK) {
   
           // 정상적으로 검색이 완료됐으면
           // 검색 목록과 마커를 표출합니다
           displayPlaces(data);
   
           // 페이지 번호를 표출합니다
           displayPagination(pagination);
   
       } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
   
           alert('검색 결과가 존재하지 않습니다.');
           return;
   
       } else if (status === kakao.maps.services.Status.ERROR) {
   
           alert('검색 결과 중 오류가 발생했습니다.');
           return;
   
       }
   }
   
   // 검색 결과 목록과 마커를 표출하는 함수입니다
   function displayPlaces(places) {
   
       var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);
   
       // 지도에 표시되고 있는 마커를 제거합니다
       removeMarker();
       
       for ( var i=0; i<places.length; i++ ) {
   
           // 마커를 생성하고 지도에 표시합니다
           var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
               marker = addMarker(placePosition, i), 
               itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
   
           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           bounds.extend(placePosition);
   
           // 마커와 검색결과 항목에 click 했을때
           // 해당 장소에 인포윈도우에 장소명을 표시합니다
           // rightclick 했을 때는 인포윈도우를 닫습니다
           (function(marker, title) {
               kakao.maps.event.addListener(marker, 'click', function() {
                   displayInfowindow(marker, title);
               });
   
               kakao.maps.event.addListener(marker, 'rightclick', function() {
                   infowindow.close();
               });
   
               itemEl.onmouseover =  function () {
                   displayInfowindow(marker, title);
               };
   
               itemEl.onmouseout =  function () {
                   infowindow.close();
               };
           })(marker, places[i].place_name);
   
           fragment.appendChild(itemEl);
       }
   
       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;
   
       // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
       map.setBounds(bounds);
   }
   
   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, places) {
   
       var el = document.createElement('li'),
       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info">' +
                   '   <h5>' + places.place_name + '</h5>';
   
       if (places.road_address_name) {
           itemStr += '    <span>' + places.road_address_name + '</span>' +
                       '   <span class="jibun gray">' +  places.address_name  + '</span>';
       } else {
           itemStr += '    <span>' +  places.address_name  + '</span>'; 
       }
                    
         itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                   '</div>';           
   
       el.innerHTML = itemStr;
       el.className = 'item';
   
       return el;
   }
   
   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
   function addMarker(position, idx, title) {
       var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
           imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
           imgOptions =  {
               spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
               spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
               offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
           },
           markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
               marker = new kakao.maps.Marker({
               position: position, // 마커의 위치
               image: markerImage 
           });
   
       marker.setMap(map); // 지도 위에 마커를 표출합니다
       markers.push(marker);  // 배열에 생성된 마커를 추가합니다
   
       return marker;
   }
   
   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
   function removeMarker() {
       for ( var i = 0; i < markers.length; i++ ) {
           markers[i].setMap(null);
       }   
       markers = [];
   }
   
   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
   function displayPagination(pagination) {
       var paginationEl = document.getElementById('pagination'),
           fragment = document.createDocumentFragment(),
           i; 
   
       // 기존에 추가된 페이지번호를 삭제합니다
       while (paginationEl.hasChildNodes()) {
           paginationEl.removeChild (paginationEl.lastChild);
       }
   
       for (i=1; i<=pagination.last; i++) {
           var el = document.createElement('a');
           el.href = "#";
           el.innerHTML = i;
   
           if (i===pagination.current) {
               el.className = 'on';
           } else {
               el.onclick = (function(i) {
                   return function() {
                       pagination.gotoPage(i);
                   }
               })(i);
           }
   
           fragment.appendChild(el);
       }
       paginationEl.appendChild(fragment);
   }
   
   
   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
   // 인포윈도우에 장소명을 표시합니다

   function displayInfowindow(marker, title) {
   
      var content = '<div style="padding:5px;z-index:1; width:200px;">' + title + '<br>' +
       '<button id="btn2" class="btn btn-outline-warning">일정 추가</button>';
       infowindow.setContent(content);
       infowindow.open(map, marker);
       
       document.getElementById('btn2').onclick = function() {select2()};
       document.getElementById('day1').onclick = function() {day1()};
       document.getElementById('day2').onclick = function() {day2()};
       document.getElementById('day3').onclick = function() {day3()};
       document.getElementById('day4').onclick = function() {day4()};
       document.getElementById('day5').onclick = function() {day5()};
       document.getElementById('day6').onclick = function() {day6()};
       document.getElementById('day7').onclick = function() {day7()};
       document.getElementById('day8').onclick = function() {day8()};
       document.getElementById('day9').onclick = function() {day9()};
       document.getElementById('day10').onclick = function() {day10()};
      
       
       function select2() {
          
          if(check1)
          {
             var i =1; 
            const table = document.getElementById('pPlace1');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.innerText = title;
            newCell1.className = "rowrow1";
           
 
          }
            
          else if(check2)
          {
            const table = document.getElementById('pPlace2');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow2";
            newCell1.innerText = title;       
          }
            
          else if(check3)
          {
            const table = document.getElementById('pPlace3');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow3";
            newCell1.innerText = title; 
          }
          
          else if(check4)
          {
            const table = document.getElementById('pPlace4');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow4";
            newCell1.innerText = title; 
          }
          
          else if(check5)
          {
            const table = document.getElementById('pPlace5');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow5";
            newCell1.innerText = title; 
          }
          
          else if(check6)
          {
            const table = document.getElementById('pPlace6');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow6";
            newCell1.innerText = title; 
          }
          
          else if(check7)
          {
            const table = document.getElementById('pPlace7');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow7";
            newCell1.innerText = title; 
          }
          
          else if(check8)
          {
            const table = document.getElementById('pPlace8');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow8";
            newCell1.innerText = title; 
          }
          
          else if(check9)
          {
            const table = document.getElementById('pPlace9');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow9";
            newCell1.innerText = title; 
          }
          
          else if(check10)
          {
            const table = document.getElementById('pPlace10');
            const newRow = table.insertRow(-1);
            
            const newCell1 = newRow.insertCell(0);
            newCell1.className = "rowrow10";
            newCell1.innerText = title; 
          }
   
       }
   
      function day1() {
         check1 = true;
         check2 = false;
         check3 = false;
         check4 = false;
         check5 = false;
         check6 = false;
         check7 = false;
         check8 = false;
         check9 = false;
         check10 = false;
         alert("day1에 일정을 추가합니다.");
      }
      
      function day2() {
         check1 = false;
         check2 = true;
         check3 = false;
         check4 = false;
         check5 = false;
         check6 = false;
         check7 = false;
         check8 = false;
         check9 = false;
         check10 = false;
         alert("day2에 일정을 추가합니다.");
      }
      function day3() {
         check1 = false;
         check2 = false;
         check3 = true;
         check4 = false;
         check5 = false;
         check6 = false;
         check7 = false;
         check8 = false;
         check9 = false;
         check10 = false;
         alert("day3에 일정을 추가합니다.");
      }
   
      function day4() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = true;
            check5 = false;
            check6 = false;
            check7 = false;
            check8 = false;
            check9 = false;
            check10 = false;
            alert("day4에 일정을 추가합니다.");
         }
      
      function day5() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = true;
            check6 = false;
            check7 = false;
            check8 = false;
            check9 = false;
            check10 = false;
            alert("day5에 일정을 추가합니다.");
         }
      
      function day6() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = false;
            check6 = true;
            check7 = false;
            check8 = false;
            check9 = false;
            check10 = false;
            alert("day6에 일정을 추가합니다.");
         }
      
      function day7() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = false;
            check6 = false;
            check7 = true;
            check8 = false;
            check9 = false;
            check10 = false;
            alert("day7에 일정을 추가합니다.");
         }
      
      function day8() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = false;
            check6 = false;
            check7 = false;
            check8 = true;
            check9 = false;
            check10 = false;
            alert("day8에 일정을 추가합니다.");
         }
      
      function day9() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = false;
            check6 = false;
            check7 = false;
            check8 = false;
            check9 = true;
            check10 = false;
            alert("day9에 일정을 추가합니다.");
         }
      
      function day10() {
            check1 = false;
            check2 = false;
            check3 = false;
            check4 = false;
            check5 = false;
            check6 = false;
            check7 = false;
            check8 = false;
            check9 = false;
            check10 = true;
            alert("day10에 일정을 추가합니다.");
         }
   
   }
   
    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
   function removeAllChildNods(el) {   
       while (el.hasChildNodes()) {
           el.removeChild (el.lastChild);
       }
   }
    ///////////////////////
   
      function deleteRow1() {
           // table element 찾기
          const table = document.getElementById('pPlace1');
          const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
   
        }
    
      function deleteRow2() {
           // table element 찾기
           const table = document.getElementById('pPlace2');
           
           // 행(Row) 삭제
          const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
         }
      
      function deleteRow3() {
           // table element 찾기
           const table = document.getElementById('pPlace3');
           
           // 행(Row) 삭제
          const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
         }
      
      function deleteRow4() {
          // table element 찾기
          const table = document.getElementById('pPlace4');
          
          // 행(Row) 삭제
         const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow5() {
          // table element 찾기
          const table = document.getElementById('pPlace5');
          
          // 행(Row) 삭제
         const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow6() {
          // table element 찾기
          const table = document.getElementById('pPlace6');
          
          // 행(Row) 삭제
         const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow7() {
          // table element 찾기
          const table = document.getElementById('pPlace7');
          
          // 행(Row) 삭제
         const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow8() {
          // table element 찾기
          const table = document.getElementById('pPlace8');
          
          // 행(Row) 삭제
        const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow9() {
          // table element 찾기
          const table = document.getElementById('pPlace9');
          
          // 행(Row) 삭제
        const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");   
          }
        }
      
      function deleteRow10() {
          // table element 찾기
          const table = document.getElementById('pPlace10');
   
          // 행(Row) 삭제
        const event = document.getElementsByTagName('tr'); 
           // 행(Row) 삭제
          if(event.length != <%=(pEnd1-pStart1)+1%>)
          {
             const newRow = table.deleteRow(-1);
          }
          else
          {
             alert("삭제할 일정이 없습니다.");  f
          }
      }
      

     var JqMap = function(){
          this.map = new Object();
      }
       
      JqMap.prototype = {
          /* key, value 값으로 구성된 데이터를 추가 */
          put: function (key, value) {
              this.map[key] = value;
          },
          /* 지정한 key값의 value값 반환 */
          get: function (key) {
              return this.map[key];
          },
          /* 구성된 key 값 존재여부 반환 */
          containsKey: function (key) {
              return key in this.map;
          },
          /* 구성된 value 값 존재여부 반환 */
          containsValue: function (value) {
              for (var prop in this.map) {
                  if (this.map[prop] == value) {
                      return true;
                  }
              }
              return false;
          },
          /* 구성된 데이터 초기화 */
          clear: function () {
              for (var prop in this.map) {
                  delete this.map[prop];
              }
          },
          /*  key에 해당하는 데이터 삭제 */
          remove: function (key) {
              delete this.map[key];
          },
          /* 배열로 key 반환 */
          keys: function () {
              var arKey = new Array();
              for (var prop in this.map) {
                  arKey.push(prop);
              }
              return arKey;
          },
          /* 배열로 value 반환 */
          values: function () {
              var arVal = new Array();
              for (var prop in this.map) {
                  arVal.push(this.map[prop]);
              }
              return arVal;
          },
          /* Map에 구성된 개수 반환 */
          size: function () {
              var count = 0;
              for (var prop in this.map) {
                  count++;
              }
              return count;
          }
      }      
      
$(document).ready(function() {
   
      $("#btnValue").on("click", function() {
       
       var place = new JqMap();     
         
       var rowrow = new Array();
       
       rowrow[0] = document.getElementsByClassName("rowrow1");
       rowrow[1] = document.getElementsByClassName("rowrow2");
       rowrow[2] = document.getElementsByClassName("rowrow3");
       rowrow[3] = document.getElementsByClassName("rowrow4");
       rowrow[4] = document.getElementsByClassName("rowrow5");
       rowrow[5] = document.getElementsByClassName("rowrow6");
       rowrow[6] = document.getElementsByClassName("rowrow7");
       rowrow[7] = document.getElementsByClassName("rowrow8");
       rowrow[8] = document.getElementsByClassName("rowrow9");
       rowrow[9] = document.getElementsByClassName("rowrow10");
       
       
       var str = "";
       
       for(var i=0;i<rowrow.length;i++)
       {
          for(var j=0;j<rowrow[i].length;j++)
          {
              if(j == 0)
              {
                    str = rowrow[i][j].innerText;
              }
              else
              {
                    str = str + " " + rowrow[i][j].innerText;  
              }
          }
          
          place.put("str"+i, str);
       }
       


        document.plan.location1.value = place.get("str0");
        document.plan.location2.value = place.get("str1");
        document.plan.location3.value = place.get("str2");
        document.plan.location4.value = place.get("str3");
        document.plan.location5.value = place.get("str4");
        document.plan.location6.value = place.get("str5");
        document.plan.location7.value = place.get("str6");
        document.plan.location8.value = place.get("str7");
        document.plan.location9.value = place.get("str8");
        document.plan.location10.value = place.get("str9");

        document.plan.action = "/planDate/planInsert2";
       
        document.plan.submit();
   });

});
////////
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>

<!-- 검색창 왼쪽 -->
    <div id="menu_wrap1" class="bg_white">
        <div id="hi" class="option">일정</div>
        <hr>
<%
   for(i=1;i<=(pEnd1-pStart1)+1;i++)
   {
%>
   <table id="pPlace<%=i%>"> 
      <tr>
         <th><div class="btn-group_option"><button id="day<%=i%>" class="row<%=i%>">Day<%=i %></button></div></th>
         <td class="rowAdd"><div class="btn-group_option"><button class="row<%=i%>" onclick='deleteRow<%=i %>(0)'>일정삭제</button></div></td>
      </tr>
   </table>
<%
   }      
%>
    <form name="plan" id="plan" method="post" target="_self">
    
         <center><div class="btn-group_submit"><button id="btnValue">완료</button></div></center>
</div>

   <input type="hidden" id="pNoSeq" name="pNoSeq" value="${pNoSeq}" />
   <input type="hidden" id="pStart" name="pStart" value="${pStart}" />
   <input type="hidden" id="pEnd" name="pEnd" value="${pEnd}" />
   <input type="hidden" id="pTitle" name="pTitle" value="${pTitle}" />
   <input type="hidden" id="location1" name="location1" value="" />
   <input type="hidden" id="location2" name="location2" value="" />
   <input type="hidden" id="location3" name="location3" value="" />
   <input type="hidden" id="location4" name="location4" value="" />
   <input type="hidden" id="location5" name="location5" value="" />
   <input type="hidden" id="location6" name="location6" value="" />
   <input type="hidden" id="location7" name="location7" value="" />
   <input type="hidden" id="location8" name="location8" value="" />
   <input type="hidden" id="location9" name="location9" value="" />
   <input type="hidden" id="location10" name="location10" value="" />
   
<% 
   for(i=1; i<=(pEnd1-pStart1)+1; i++) 
   {
%>
   <input type="hidden" id="pDay<%=i %>" name="pDay<%=i %>" value="<%= pStart1 +(i-1)%>" />
<%
   }
%>
</form>
</body>
</html>