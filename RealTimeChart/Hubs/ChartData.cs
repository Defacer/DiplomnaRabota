using Microsoft.AspNet.SignalR;
using RealTimeChart.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;

namespace RealTimeChart.Hubs
{
    public class ChartData
    {
        private readonly static Lazy<ChartData> _instance = new Lazy<ChartData>(() => new ChartData());
        private readonly ConcurrentQueue<StationMonitoringInfo> _points = new ConcurrentQueue<StationMonitoringInfo>();
        private readonly int _updateInterval = 300; //ms        
        private Timer _timer;
        private readonly object _updatePointsLock = new object();
        private bool _updatingData = false;
        private readonly Random _updateOrNotRandom = new Random();
        private StationMonitoringInfo _startPoint;
        private int _minPoint = 0, _maxPoint = 99;
        private int _machineId;
        
        private ChartData()
        {
           
           
        }

        public static ChartData Instance
        {
            get
            {
                return _instance.Value;
            }
        }


        /// <summary>
        /// To initialize timer and data
        /// </summary>
        /// <returns></returns>
        public IEnumerable<StationMonitoringInfo> initData(string machineId)
        {
            _machineId = Int32.Parse(machineId);
            using (var context = new GraphContext())
            {
                _startPoint = context.StationMonitoringInfos.Find(_machineId);
                // Perform data access using the context 
            }
            _points.Enqueue(_startPoint);
            _timer = new Timer(TimerCallBack, null, _updateInterval, _updateInterval);
            return _points.ToArray();
        }

        /// <summary>
        /// Timer callback method
        /// </summary>
        /// <param name="state"></param>
        private void TimerCallBack(object state)
        {
            // This function must be re-entrant as it's running as a timer interval handler
           // if (_updatingData)
           /// {
                //return;
            //}
           // else
           // {
              //  if (!_updatingData)
               // {
                   // _updatingData = true;

                    // Randomly choose whether to udpate this point or not           
                    // if (_updateOrNotRandom.Next(0, 3) == 1)
                    // {
                    BroadcastChartData(UpdateData());
                    // }
                   // _updatingData = false;
               // }
            //}
        }

        /// <summary>
        /// To update data (Generate random point in our case)
        /// </summary>
        /// <returns></returns>
        private StationMonitoringInfo UpdateData()
        {
            StationMonitoringInfo point =new StationMonitoringInfo(){
                 Name=_startPoint.Name,
                  CPUValue=_startPoint.CPUValue,
                   MemoryValue=_startPoint.MemoryValue,
                    StationMonitoringInfoID=_startPoint.StationMonitoringInfoID
            } ;
            if (_points.TryDequeue(out point))
            {
                // Update the point price by a random factor of the range percent
               // var random = new Random();
                //var pos = random.NextDouble() > .51;
               // var change = random.Next((int)point / 2);
               // change = pos ? change : -change;
                using (var context = new GraphContext())
                {
                    point = context.StationMonitoringInfos.Find(_machineId); ;
                    // Perform data access using the context 
                }
            
               
                
                
                _points.Enqueue(point);
            }
           // return point;
           // var point = ct.StationMonitoringInfos.First().CPUValue;
            return point;
        }


        private void BroadcastChartData(StationMonitoringInfo point)
        {
            GetClients().updateData(point);
        }

        private static dynamic GetClients()
        {
            return GlobalHost.ConnectionManager.GetHubContext<ChartDataHub>().Clients.All;
        }
        

    }
}