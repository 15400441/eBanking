

var myChart = echarts.init(document.getElementById('chart'));
var accNo = $("#accNo").val();
$.get("/eBanking/transfer/getTransfer.do?accNo=" + accNo, function(result){
       
		
        var option = {
            title: {
                text: '本月收支图',
                x: 'left',
                y: 'top',
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['收入', '支出']
            },
            toolbox: {
                show: true,
                x: 'right',
                y: 'top',
                feature: {
                    mark: {
                        show: true
                    },
                   
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            xAxis: [{
                show: true,
                type: 'category',
                data: result.timesList
            }],
            yAxis: [{
                show: true,
                type: 'value'
            }],
            series: [{
                name: '收入',
                type: 'bar',
                data: result.outList,
                markPoint: {
                    data: [{
                        type: 'max',
                        name: '最大值'
                    }, {
                        type: 'min',
                        name: '最小值'
                    }]
                },
               
            }, {
                name: '支出',
                type: 'bar',
                data: result.inList,
				markPoint: {
                    data: [{
                        type: 'max',
                        name: '最大值'
                    }, {
                        type: 'min',
                        name: '最小值'
                    }]
                },
               
               
            }]
        };
        
        myChart.setOption(option);
        
        
        
                 
        
        
    
});




