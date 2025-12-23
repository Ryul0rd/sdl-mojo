

comptime DispatchableHandle = UInt
comptime NonDispatchableHandle = UInt64

comptime VkInstance = DispatchableHandle
comptime VkPhysicalDevice = DispatchableHandle
comptime VkSurfaceKHR = NonDispatchableHandle


struct VkAllocationCallbacks:
    pass