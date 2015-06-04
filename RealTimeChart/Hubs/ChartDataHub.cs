//using DatabaseChange.Hubs;
//using DatabaseChange.Models;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using RealTimeChart.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace RealTimeChart.Hubs
{
    [HubName("chartData")]
    public class ChartDataHub : Hub
    {
        private readonly ChartData _pointer;

        public ChartDataHub() : this(ChartData.Instance) { }

        public ChartDataHub(ChartData pointer)
        {
            _pointer = pointer;
        }

        public IEnumerable<StationMonitoringInfo> initData(string machineId)
        {
//            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
//            {
//                connection.Open();
//                using (SqlCommand command = new SqlCommand(@"SELECT [JobID],[Name],[LastExecutionDate],[Status]
//                               FROM [dbo].[JobInfoes]", connection))
//                {
//                    // Make sure the command object does not already have
//                    // a notification object associated with it.
//                    command.Notification = null;

//                    SqlDependency dependency = new SqlDependency(command);
//                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);

//                    if (connection.State == ConnectionState.Closed)
//                        connection.Open();

//                    using (var reader = command.ExecuteReader())
//                       List<JobInfo> rtrt=reader.Cast<IDataRecord>()
//                            .Select(x => new JobInfo()
//                          {
//                                JobID = x.GetInt32(0),
//                                Name = x.GetString(1),
//                                LastExecutionDate = x.GetDateTime(2),
//                                Status = x.GetString(3)
//                            }).ToList();
//                }
//            }
            return _pointer.initData(machineId);
        }
        
    }
}
