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
//
// TODO auto-generated type

// This is a basic test proggie to become familiar with omnetpp
// Written by: Paul Jay

import test;			//import namespace from test.cc

simple Node
{
    gates:
        input in;		//single input gate
        output out;		//single output gate
        input vin[]; 	//vectored input gate
        output vout[];	//vectored output gate
}

network test  //just cobbling for now...later match the (simple) module name in c++ with that in this .ned file
{
    submodules:
        node1: Node;	//this may be where to use simple module defined in ModTest class in .cc
        node2: Node {
            @display("p=87,33"); //just for display in Design mode
        }
        node3: Node;
        node4: Node {
            @display("p=30,100"); //just for display in Design mode
        }
    connections:
        node1.out --> node1to2: { delay=1ms; datarate = 100Mbps; } --> node2.in;	//simple gates (with channel name)
        node2.in <-- node2to1: { delay=1ms; datarate = 100Mbps; } <-- node1.out;	//simple gates (with channel name)
        node3.vout++ --> {  datarate = 100Mbps; } --> node4.vin++;					//auto expand gate vectors
        node3.vin++ <-- {  datarate = 100Mbps; } <-- node4.vout++;					//auto expand gate vectors

}
