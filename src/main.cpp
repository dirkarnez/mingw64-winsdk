#define NTDDI_VERSION NTDDI_WINBLUE

#include <iostream>
#include <shellscalingapi.h>

int main()
{
    PROCESS_DPI_AWARENESS result;
    GetProcessDpiAwareness(nullptr, &result);
    std::cout << "Hello World!" << result << std::endl;
    std::cout << "Hello World!" << PROCESS_DPI_AWARENESS::PROCESS_SYSTEM_DPI_AWARE << std::endl;
    std::cin.get();
    return 0;
}
