<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    #modalOpenButton, #modalCloseButton {
        cursor: pointer;
    }

    #video {
        text-align: center;
    }

    #myVideo {
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 30px;
    }

    .main-button-yellow{
        align-items: center;
    }

    #att_form{
        text-align: center;
    }


    .att_right_head {
        padding: 20px;
        font-size: 18px;
        font-weight: 700;
        color: #f5a425;
    }

    #resultDiv {
        margin-top: 170px;
        margin-bottom: 170px;
        font-size: 18px;
        font-weight: 700;
        text-align: center;
        color: #838383;
    }

    #issue1, #issue2, #server_time {
        margin-left: 50px;
        font-size: 15px;
        font-weight: 500;
        color: #838383;
    }

    #issue1, #server_time {
        margin-top: 10px;
    }

    #issue2, #server_time {
        margin-bottom: 10px;
    }

    #modalContainer {
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        background: rgba(0, 0, 0, 0.5);
    }

    #modalContent {
        border-radius: 30px;
        position: absolute;
        background-color: rgba(0,0,0,0);
        width: 550px;
        height: 450px;
        padding: 15px;
        text-align: center;
    }

    #modalContainer.hidden {
        display: none;
    }

    #myCanvas {
        border-radius: 30px;
    }

</style>

<script>
    let att_check = {
        myVideoStream: null,
        init: function (interval) {
            this.myVideoStream = document.querySelector('#myVideo');
            const modalOpenButton = document.getElementById('modalOpenButton');
            const modalCloseButton = document.getElementById('modalCloseButton');
            const modal = document.getElementById('modalContainer');

            modalOpenButton.addEventListener('click', () => {
                modal.classList.remove('hidden');
            });

            modalCloseButton.addEventListener('click', () => {
                modal.classList.add('hidden');
            });
            att_check.rateDisplay();
        },
        getRate: function () {
            $.ajax({
                url: '/getrate',
                success: function (data) {
                    att_check.rateDisplay(data);
                }
            })
        },
        rateDisplay: function () {
            //출결테이블 생성 후, 데이터 JSON으로 ajax통신 추후 정정 예정
            function renderIcons() {

                // Move icon
                if (!this.series[0].icon) {
                    this.series[0].icon = this.renderer.path(['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8])
                        .attr({
                            stroke: '#303030',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                            'stroke-width': 2,
                            zIndex: 10
                        })
                        .add(this.series[2].group);
                }
                this.series[0].icon.translate(
                    this.chartWidth / 2 - 10,
                    this.plotHeight / 2 - this.series[0].points[0].shapeArgs.innerR -
                    (this.series[0].points[0].shapeArgs.r - this.series[0].points[0].shapeArgs.innerR) / 2
                );

                // Exercise icon
                if (!this.series[1].icon) {
                    this.series[1].icon = this.renderer.path(
                        ['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8,
                            'M', 8, -8, 'L', 16, 0, 8, 8]
                    )
                        .attr({
                            stroke: '#ffffff',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                            'stroke-width': 2,
                            zIndex: 10
                        })
                        .add(this.series[2].group);
                }
                this.series[1].icon.translate(
                    this.chartWidth / 2 - 10,
                    this.plotHeight / 2 - this.series[1].points[0].shapeArgs.innerR -
                    (this.series[1].points[0].shapeArgs.r - this.series[1].points[0].shapeArgs.innerR) / 2
                );

                // Stand icon
                if (!this.series[2].icon) {
                    this.series[2].icon = this.renderer.path(['M', 0, 8, 'L', 0, -8, 'M', -8, 0, 'L', 0, -8, 8, 0])
                        .attr({
                            stroke: '#303030',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                            'stroke-width': 2,
                            zIndex: 10
                        })
                        .add(this.series[2].group);
                }

                this.series[2].icon.translate(
                    this.chartWidth / 2 - 10,
                    this.plotHeight / 2 - this.series[2].points[0].shapeArgs.innerR -
                    (this.series[2].points[0].shapeArgs.r - this.series[2].points[0].shapeArgs.innerR) / 2
                );
            }

            Highcharts.chart('container', {

                chart: {
                    backgroundColor: 'rgba(0,0,0,0)',
                    type: 'solidgauge',
                    height: '110%',
                    events: {
                        render: renderIcons
                    }
                },

                title: {
                    text: 'Activity',
                    style: {
                        fontSize: '0px'
                    }
                },

                tooltip: {
                    borderWidth: 0,
                    backgroundColor: 'none',
                    shadow: false,
                    style: {
                        fontSize: '16px'
                    },
                    valueSuffix: '%',
                    pointFormat: '{series.name}<br><span style="font-size:2em; color: {point.color}; font-weight: bold">{point.y}</span>',
                    positioner: function (labelWidth) {
                        return {
                            x: (this.chart.chartWidth - labelWidth) / 2,
                            y: (this.chart.plotHeight / 2) + 15
                        };
                    }
                },

                pane: {
                    startAngle: 0,
                    endAngle: 360,
                    background: [{ // Track for Move
                        outerRadius: '112%',
                        innerRadius: '88%',
                        backgroundColor: 'rgba(226,221,168,0.33)',
                        borderWidth: 0
                    }, { // Track for Exercise
                        outerRadius: '87%',
                        innerRadius: '63%',
                        backgroundColor: 'rgba(169,215,181,0.21)',
                        borderWidth: 0
                    }, { // Track for Stand
                        outerRadius: '62%',
                        innerRadius: '38%',
                        backgroundColor: 'rgba(134,185,198,0.24)',
                        borderWidth: 0
                    }]
                },

                yAxis: {
                    min: 0,
                    max: 100,
                    lineWidth: 0,
                    tickPositions: []
                },

                plotOptions: {
                    solidgauge: {
                        dataLabels: {
                            enabled: false
                        },
                        linecap: 'round',
                        stickyTracking: false,
                        rounded: true
                    }
                },

                series: [{
                    name: 'Total',
                    style:{
                        color: 'e2dda8'
                    },
                    data: [{
                        color: '#e2dda8',
                        radius: '112%',
                        innerRadius: '88%',
                        y: 80
                    }]
                }, {
                    name: 'Month',
                    data: [{
                        color: '#a9d7b5',
                        radius: '87%',
                        innerRadius: '63%',
                        y: 65
                    }]
                }, {
                    name: 'Week',
                    data: [{
                        color: '#86b9c6',
                        radius: '62%',
                        innerRadius: '38%',
                        y: 50
                    }]
                }]
            });
        },
        getTime: function () {
            setInterval(function () {
                $.ajax({
                    url: '/getservertime',
                    success: function (data) {
                        att_check.displayTime(data);
                    },
                    error: function () {
                        alert('Server Error');
                    }
                });
            }, 1000)
        },
        displayTime: function (data) {
            $('#server_time').html(data.now);
            if (data.day == 2 || data.day == 4 || data.day == 6) {
                $('#issue1').text('Daily Test is Scheduled to bigin at 9:00 AM.');
                $('#issue2').text('So, Please be prepared!');
            };
            if (data.day == 3 || data.day == 5) {
                $('#issue1').text('Individual Assignment will be given today.');
                $('#issue2').text("Don't Forget to Upload to GitHub.");
            };
            if (data.day == 1 || data.day == 7) {
                $('#issue1').text('No Need to Mark Attendance on Weekends!');
                $('#issue2').text('See You on Monday!');
            };
        },
        getVideo: function () {
            navigator.getMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
            navigator.getMedia(
                {video: true, audio: false},
                function (stream) {
                    att_check.myVideoStream.srcObject = stream
                    att_check.myVideoStream.play();
                },
                function (error) {
                    alert('webcam not working');
                });
        },
        takeSnapshot: function () {
            var myCanvasElement = document.querySelector('#myCanvas');
            var myCTX = myCanvasElement.getContext('2d');
            myCTX.drawImage(this.myVideoStream, 0, 0, myCanvasElement.width, myCanvasElement.height);
        },
        send: function () {
            const canvas = document.querySelector('#myCanvas');
            const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
            const decodImg = atob(imgBase64.split(',')[1]);
            let array = [];
            for (let i = 0; i < decodImg.length; i++) {
                array.push(decodImg.charCodeAt(i));
            }
            const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
            const fileName = 'snapshot_' + new Date().getMilliseconds() + '.jpg';
            let formData = new FormData();
            formData.append('file', file, fileName);
            $.ajax({
                type: 'post',
                url: '/saveimg',
                enctype: 'multipart/form-data',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    $('#imgname').val(data);
                }
            });
        },
        submit: function () {
            const modal = document.getElementById('modalContainer');
            modal.classList.add('hidden');
            let imgname = $('#imgname').val();
            if( imgname == ''){
                alert('Press Save First');
            } else {
                $.ajax({
                    type: 'post',
                    url: 'att_checkimpl',
                    data: {imgname: imgname},
                    success: function (data) {
                        $('#video').html('');
                        $('#att_result').append(
                            $('<div>').prop({
                                id: 'resultDiv',
                                innerHTML: data,
                            })
                        );
                    }
                })
            }
        }
    };
    $(function () {
        att_check.init();
        att_check.getVideo();
        att_check.getTime();
    });
</script>

<section class="apply-now" id="apply">
    <!--Attendance Rate Chart-->
    <div class="container">
        <div class="row">
            <div class="col-lg-6 align-self-center">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="item">
                            <h3>ATTENDANCE RATE</h3>
                            <div id="container" class="col-lg-12"></div>
                        </div>
                    </div>
                </div>
            </div>
    <!--Attendance Rate Chart End-->

    <!--Attendance Check Area-->
            <div class="col-lg-6">
                <div class="accordions is-first-expanded">
                    <article class="accordion">
                        <div class="accordion-head">
                            <span class="att_right_head">Current Time</span><br>
                            <p id="server_time"></p>
                            <span class="att_right_head">Today's ISSUE</span>
                            <p id="issue1"></p>
                            <p id="issue2"></p>
                        </div>
                    </article>
                    <article class="accordion">
                        <div class="accordion-head">
                            <span class="att_right_head">ATTENDENCE CHECK</span>
                            <div id = "att_result">
                                <div id = "video" class="content">
                                    <video id="myVideo" width="440" height="330"
                                           style="margin-top: 5px;margin-bottom: 5px;border-radius: 30px;"></video>
                                    <div class="main-button-yellow">
                                        <a href="javascript:void(0)" id="modalOpenButton"
                                           onclick="att_check.takeSnapshot();">Pic</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <!--Attendance Check Area-->
</section>

    <!--Pic Send Modal-->
<div id="modalContainer" class="hidden">
    <div id="modalContent">
        <div class="main-button-yellow">
            <canvas id="myCanvas" width="500" height="375"></canvas>
            <br>
            <form id="att_form" action="/mycfr2" method="get">
                <a href="javascript:void(0)" onclick="att_check.send();">SAVE</a>
                <a href="#" onclick="att_check.submit();">ATTENDANCE</a>
                <a href="#" id=modalCloseButton>Close</a>
                <input type="hidden" name="imgname" id="imgname">
            </form>
        </div>
    </div>
</div>
<!--Pic Send Modal-->
