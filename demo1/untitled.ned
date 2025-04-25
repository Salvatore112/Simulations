//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
import ned.IdealChannel;
import org.omnetpp.queueing.Allocate;
import org.omnetpp.queueing.Deallocate;
import org.omnetpp.queueing.Delay;
import org.omnetpp.queueing.ResourcePool;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO documentation
//
network Network
{
    @display("bgb=1023,503");
    submodules:
        source: Source {
            @display("p=194,107");
        }
        allocate: Allocate {
            @display("p=391,142");
        }
        delay: Delay {
            @display("p=554,137");
        }
        deallocate: Deallocate {
            @display("p=687,153");
        }
        allocate1: Allocate {
            @display("p=393,256");
        }
        delay1: Delay {
            @display("p=561,277");
        }
        deallocate1: Deallocate {
            @display("p=701,295");
        }
        resourcePool: ResourcePool {
            @display("p=756,51");
        }
        resourcePool1: ResourcePool {
            @display("p=352,378");
        }
        sinkStat: SinkStat {
            @display("p=899,344");
        }
    connections:
        source.out --> IdealChannel --> allocate.in++;
        allocate.out --> IdealChannel --> delay.in++;
        delay.out --> IdealChannel --> deallocate.in++;
        deallocate.out --> IdealChannel --> allocate1.in++;
        allocate1.out --> IdealChannel --> delay1.in++;
        delay1.out --> IdealChannel --> deallocate1.in++;
        deallocate1.out --> IdealChannel --> sinkStat.in++;
}

