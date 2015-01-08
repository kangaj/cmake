#include <iostream>
#include "HelloWorld/HelloWorld.h"
#include "Poco/Environment.h"

HelloWorld::HelloWorld()
{
}

HelloWorld::~HelloWorld()
{
}


void HelloWorld::Print()
{
    std::cout << "Hello World!" << std::endl;
    std::cout << "Using Poco version: " << Poco::Environment::libraryVersion() << std::endl;
}
