/*
 * test.cc
 *
 *  Created on: Oct 18, 2020
 *      Author: PJAY
 */


namespace test {

    Define_Module(ModTest);

    //define class here (in .cc) rather than .h for simplicity
    class ModTest : public cSimpleModule
    {

    protected:
      virtual void Initialize();
      virtual void handleMessage(cMessage *msg);

    void ModTest::Initialize()
    {
        // generate messages here to be handled by handleMessage
    }

    void ModTest::handleMessage(cMessage *msg)
    {
        // simply relay handled message out
        send(msg, "out");

        // generate & send new packet
        cMessage *pkt = new cMessage;
        send(pkt, "out");
    }

    };

}




