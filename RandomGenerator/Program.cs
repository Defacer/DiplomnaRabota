
using RealTimeChart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace RandomGenerator
{
    class Program
    {
        static void Main(string[] args)
        {
            GraphContext ct = new GraphContext();
            var graphs = ct.StationMonitoringInfos.ToList();
            var uplimit = graphs.Count - 1;
            var upName=100;
            var random = new Random();
            var randomName = new Random();
            while(true)
            {

                
                var randpos = random.Next(uplimit);
                
                var randname = randomName.Next(upName);
                graphs[randpos].CPUValue = randname;
                ct.SaveChanges();
               // var randpos2 = random.Next(uplimit);

                var randname2 = randomName.Next(upName);
                graphs[randpos].MemoryValue = randname2;
                ct.SaveChanges();

               Thread.Sleep(600);


            }
        }
    }
}
