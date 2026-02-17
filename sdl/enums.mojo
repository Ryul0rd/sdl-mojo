

struct AudioFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = AudioFormat(value = 0)
    comptime U8 = AudioFormat(value = 8)
    comptime S8 = AudioFormat(value = 32776)
    comptime S16LE = AudioFormat(value = 32784)
    comptime S16BE = AudioFormat(value = 36880)
    comptime S32LE = AudioFormat(value = 32800)
    comptime S32BE = AudioFormat(value = 36896)
    comptime F32LE = AudioFormat(value = 33056)
    comptime F32BE = AudioFormat(value = 37152)
    comptime S16 = AudioFormat(value = 32784)
    comptime S32 = AudioFormat(value = 32800)
    comptime F32 = AudioFormat(value = 33056)


struct BlendOperation(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlendOperation
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime ADD = BlendOperation(value = 1)
    comptime SUBTRACT = BlendOperation(value = 2)
    comptime REV_SUBTRACT = BlendOperation(value = 3)
    comptime MINIMUM = BlendOperation(value = 4)
    comptime MAXIMUM = BlendOperation(value = 5)


struct BlendFactor(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlendFactor
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime ZERO = BlendFactor(value = 1)
    comptime ONE = BlendFactor(value = 2)
    comptime SRC_COLOR = BlendFactor(value = 3)
    comptime ONE_MINUS_SRC_COLOR = BlendFactor(value = 4)
    comptime SRC_ALPHA = BlendFactor(value = 5)
    comptime ONE_MINUS_SRC_ALPHA = BlendFactor(value = 6)
    comptime DST_COLOR = BlendFactor(value = 7)
    comptime ONE_MINUS_DST_COLOR = BlendFactor(value = 8)
    comptime DST_ALPHA = BlendFactor(value = 9)
    comptime ONE_MINUS_DST_ALPHA = BlendFactor(value = 10)


struct CameraPosition(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CameraPosition
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = CameraPosition(value = 0)
    comptime FRONT_FACING = CameraPosition(value = 1)
    comptime BACK_FACING = CameraPosition(value = 2)


struct CameraPermissionState(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CameraPermissionState
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime DENIED = CameraPermissionState(value = -1)
    comptime PENDING = CameraPermissionState(value = 0)
    comptime APPROVED = CameraPermissionState(value = 1)


struct EventType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EventType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime FIRST = EventType(value = 0)
    comptime QUIT = EventType(value = 256)
    comptime TERMINATING = EventType(value = 257)
    comptime LOW_MEMORY = EventType(value = 258)
    comptime WILL_ENTER_BACKGROUND = EventType(value = 259)
    comptime DID_ENTER_BACKGROUND = EventType(value = 260)
    comptime WILL_ENTER_FOREGROUND = EventType(value = 261)
    comptime DID_ENTER_FOREGROUND = EventType(value = 262)
    comptime LOCALE_CHANGED = EventType(value = 263)
    comptime SYSTEM_THEME_CHANGED = EventType(value = 264)
    comptime DISPLAY_ORIENTATION = EventType(value = 337)
    comptime DISPLAY_ADDED = EventType(value = 338)
    comptime DISPLAY_REMOVED = EventType(value = 339)
    comptime DISPLAY_MOVED = EventType(value = 340)
    comptime DISPLAY_DESKTOP_MODE_CHANGED = EventType(value = 341)
    comptime DISPLAY_CURRENT_MODE_CHANGED = EventType(value = 342)
    comptime DISPLAY_CONTENT_SCALE_CHANGED = EventType(value = 343)
    comptime DISPLAY_USABLE_BOUNDS_CHANGED = EventType(value = 344)
    comptime DISPLAY_FIRST = EventType(value = 337)
    comptime DISPLAY_LAST = EventType(value = 344)
    comptime WINDOW_SHOWN = EventType(value = 514)
    comptime WINDOW_HIDDEN = EventType(value = 515)
    comptime WINDOW_EXPOSED = EventType(value = 516)
    comptime WINDOW_MOVED = EventType(value = 517)
    comptime WINDOW_RESIZED = EventType(value = 518)
    comptime WINDOW_PIXEL_SIZE_CHANGED = EventType(value = 519)
    comptime WINDOW_METAL_VIEW_RESIZED = EventType(value = 520)
    comptime WINDOW_MINIMIZED = EventType(value = 521)
    comptime WINDOW_MAXIMIZED = EventType(value = 522)
    comptime WINDOW_RESTORED = EventType(value = 523)
    comptime WINDOW_MOUSE_ENTER = EventType(value = 524)
    comptime WINDOW_MOUSE_LEAVE = EventType(value = 525)
    comptime WINDOW_FOCUS_GAINED = EventType(value = 526)
    comptime WINDOW_FOCUS_LOST = EventType(value = 527)
    comptime WINDOW_CLOSE_REQUESTED = EventType(value = 528)
    comptime WINDOW_HIT_TEST = EventType(value = 529)
    comptime WINDOW_ICCPROF_CHANGED = EventType(value = 530)
    comptime WINDOW_DISPLAY_CHANGED = EventType(value = 531)
    comptime WINDOW_DISPLAY_SCALE_CHANGED = EventType(value = 532)
    comptime WINDOW_SAFE_AREA_CHANGED = EventType(value = 533)
    comptime WINDOW_OCCLUDED = EventType(value = 534)
    comptime WINDOW_ENTER_FULLSCREEN = EventType(value = 535)
    comptime WINDOW_LEAVE_FULLSCREEN = EventType(value = 536)
    comptime WINDOW_DESTROYED = EventType(value = 537)
    comptime WINDOW_HDR_STATE_CHANGED = EventType(value = 538)
    comptime WINDOW_FIRST = EventType(value = 514)
    comptime WINDOW_LAST = EventType(value = 538)
    comptime KEY_DOWN = EventType(value = 768)
    comptime KEY_UP = EventType(value = 769)
    comptime TEXT_EDITING = EventType(value = 770)
    comptime TEXT_INPUT = EventType(value = 771)
    comptime KEYMAP_CHANGED = EventType(value = 772)
    comptime KEYBOARD_ADDED = EventType(value = 773)
    comptime KEYBOARD_REMOVED = EventType(value = 774)
    comptime TEXT_EDITING_CANDIDATES = EventType(value = 775)
    comptime SCREEN_KEYBOARD_SHOWN = EventType(value = 776)
    comptime SCREEN_KEYBOARD_HIDDEN = EventType(value = 777)
    comptime MOUSE_MOTION = EventType(value = 1024)
    comptime MOUSE_BUTTON_DOWN = EventType(value = 1025)
    comptime MOUSE_BUTTON_UP = EventType(value = 1026)
    comptime MOUSE_WHEEL = EventType(value = 1027)
    comptime MOUSE_ADDED = EventType(value = 1028)
    comptime MOUSE_REMOVED = EventType(value = 1029)
    comptime JOYSTICK_AXIS_MOTION = EventType(value = 1536)
    comptime JOYSTICK_BALL_MOTION = EventType(value = 1537)
    comptime JOYSTICK_HAT_MOTION = EventType(value = 1538)
    comptime JOYSTICK_BUTTON_DOWN = EventType(value = 1539)
    comptime JOYSTICK_BUTTON_UP = EventType(value = 1540)
    comptime JOYSTICK_ADDED = EventType(value = 1541)
    comptime JOYSTICK_REMOVED = EventType(value = 1542)
    comptime JOYSTICK_BATTERY_UPDATED = EventType(value = 1543)
    comptime JOYSTICK_UPDATE_COMPLETE = EventType(value = 1544)
    comptime GAMEPAD_AXIS_MOTION = EventType(value = 1616)
    comptime GAMEPAD_BUTTON_DOWN = EventType(value = 1617)
    comptime GAMEPAD_BUTTON_UP = EventType(value = 1618)
    comptime GAMEPAD_ADDED = EventType(value = 1619)
    comptime GAMEPAD_REMOVED = EventType(value = 1620)
    comptime GAMEPAD_REMAPPED = EventType(value = 1621)
    comptime GAMEPAD_TOUCHPAD_DOWN = EventType(value = 1622)
    comptime GAMEPAD_TOUCHPAD_MOTION = EventType(value = 1623)
    comptime GAMEPAD_TOUCHPAD_UP = EventType(value = 1624)
    comptime GAMEPAD_SENSOR_UPDATE = EventType(value = 1625)
    comptime GAMEPAD_UPDATE_COMPLETE = EventType(value = 1626)
    comptime GAMEPAD_STEAM_HANDLE_UPDATED = EventType(value = 1627)
    comptime FINGER_DOWN = EventType(value = 1792)
    comptime FINGER_UP = EventType(value = 1793)
    comptime FINGER_MOTION = EventType(value = 1794)
    comptime FINGER_CANCELED = EventType(value = 1795)
    comptime PINCH_BEGIN = EventType(value = 1808)
    comptime PINCH_UPDATE = EventType(value = 1809)
    comptime PINCH_END = EventType(value = 1810)
    comptime CLIPBOARD_UPDATE = EventType(value = 2304)
    comptime DROP_FILE = EventType(value = 4096)
    comptime DROP_TEXT = EventType(value = 4097)
    comptime DROP_BEGIN = EventType(value = 4098)
    comptime DROP_COMPLETE = EventType(value = 4099)
    comptime DROP_POSITION = EventType(value = 4100)
    comptime AUDIO_DEVICE_ADDED = EventType(value = 4352)
    comptime AUDIO_DEVICE_REMOVED = EventType(value = 4353)
    comptime AUDIO_DEVICE_FORMAT_CHANGED = EventType(value = 4354)
    comptime SENSOR_UPDATE = EventType(value = 4608)
    comptime PEN_PROXIMITY_IN = EventType(value = 4864)
    comptime PEN_PROXIMITY_OUT = EventType(value = 4865)
    comptime PEN_DOWN = EventType(value = 4866)
    comptime PEN_UP = EventType(value = 4867)
    comptime PEN_BUTTON_DOWN = EventType(value = 4868)
    comptime PEN_BUTTON_UP = EventType(value = 4869)
    comptime PEN_MOTION = EventType(value = 4870)
    comptime PEN_AXIS = EventType(value = 4871)
    comptime CAMERA_DEVICE_ADDED = EventType(value = 5120)
    comptime CAMERA_DEVICE_REMOVED = EventType(value = 5121)
    comptime CAMERA_DEVICE_APPROVED = EventType(value = 5122)
    comptime CAMERA_DEVICE_DENIED = EventType(value = 5123)
    comptime RENDER_TARGETS_RESET = EventType(value = 8192)
    comptime RENDER_DEVICE_RESET = EventType(value = 8193)
    comptime RENDER_DEVICE_LOST = EventType(value = 8194)
    comptime PRIVATE0 = EventType(value = 16384)
    comptime PRIVATE1 = EventType(value = 16385)
    comptime PRIVATE2 = EventType(value = 16386)
    comptime PRIVATE3 = EventType(value = 16387)
    comptime POLL_SENTINEL = EventType(value = 32512)
    comptime USER = EventType(value = 32768)
    comptime LAST = EventType(value = 65535)
    comptime ENUM_PADDING = EventType(value = 2147483647)


struct EventAction(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EventAction
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime ADDEVENT = EventAction(value = 0)
    comptime PEEKEVENT = EventAction(value = 1)
    comptime GETEVENT = EventAction(value = 2)


struct Folder(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Folder
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime HOME = Folder(value = 0)
    comptime DESKTOP = Folder(value = 1)
    comptime DOCUMENTS = Folder(value = 2)
    comptime DOWNLOADS = Folder(value = 3)
    comptime MUSIC = Folder(value = 4)
    comptime PICTURES = Folder(value = 5)
    comptime PUBLICSHARE = Folder(value = 6)
    comptime SAVEDGAMES = Folder(value = 7)
    comptime SCREENSHOTS = Folder(value = 8)
    comptime TEMPLATES = Folder(value = 9)
    comptime VIDEOS = Folder(value = 10)
    comptime COUNT = Folder(value = 11)


struct PathType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PathType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = PathType(value = 0)
    comptime FILE = PathType(value = 1)
    comptime DIRECTORY = PathType(value = 2)
    comptime OTHER = PathType(value = 3)


struct EnumerationResult(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerationResult
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime CONTINUE = EnumerationResult(value = 0)
    comptime SUCCESS = EnumerationResult(value = 1)
    comptime FAILURE = EnumerationResult(value = 2)


struct GamepadType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = GamepadType(value = 0)
    comptime STANDARD = GamepadType(value = 1)
    comptime XBOX360 = GamepadType(value = 2)
    comptime XBOXONE = GamepadType(value = 3)
    comptime PS3 = GamepadType(value = 4)
    comptime PS4 = GamepadType(value = 5)
    comptime PS5 = GamepadType(value = 6)
    comptime NINTENDO_SWITCH_PRO = GamepadType(value = 7)
    comptime NINTENDO_SWITCH_JOYCON_LEFT = GamepadType(value = 8)
    comptime NINTENDO_SWITCH_JOYCON_RIGHT = GamepadType(value = 9)
    comptime NINTENDO_SWITCH_JOYCON_PAIR = GamepadType(value = 10)
    comptime GAMECUBE = GamepadType(value = 11)
    comptime COUNT = GamepadType(value = 12)


struct GamepadButton(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadButton
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GamepadButton(value = -1)
    comptime SOUTH = GamepadButton(value = 0)
    comptime EAST = GamepadButton(value = 1)
    comptime WEST = GamepadButton(value = 2)
    comptime NORTH = GamepadButton(value = 3)
    comptime BACK = GamepadButton(value = 4)
    comptime GUIDE = GamepadButton(value = 5)
    comptime START = GamepadButton(value = 6)
    comptime LEFT_STICK = GamepadButton(value = 7)
    comptime RIGHT_STICK = GamepadButton(value = 8)
    comptime LEFT_SHOULDER = GamepadButton(value = 9)
    comptime RIGHT_SHOULDER = GamepadButton(value = 10)
    comptime DPAD_UP = GamepadButton(value = 11)
    comptime DPAD_DOWN = GamepadButton(value = 12)
    comptime DPAD_LEFT = GamepadButton(value = 13)
    comptime DPAD_RIGHT = GamepadButton(value = 14)
    comptime MISC1 = GamepadButton(value = 15)
    comptime RIGHT_PADDLE1 = GamepadButton(value = 16)
    comptime LEFT_PADDLE1 = GamepadButton(value = 17)
    comptime RIGHT_PADDLE2 = GamepadButton(value = 18)
    comptime LEFT_PADDLE2 = GamepadButton(value = 19)
    comptime TOUCHPAD = GamepadButton(value = 20)
    comptime MISC2 = GamepadButton(value = 21)
    comptime MISC3 = GamepadButton(value = 22)
    comptime MISC4 = GamepadButton(value = 23)
    comptime MISC5 = GamepadButton(value = 24)
    comptime MISC6 = GamepadButton(value = 25)
    comptime COUNT = GamepadButton(value = 26)


struct GamepadButtonLabel(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadButtonLabel
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = GamepadButtonLabel(value = 0)
    comptime A = GamepadButtonLabel(value = 1)
    comptime B = GamepadButtonLabel(value = 2)
    comptime X = GamepadButtonLabel(value = 3)
    comptime Y = GamepadButtonLabel(value = 4)
    comptime CROSS = GamepadButtonLabel(value = 5)
    comptime CIRCLE = GamepadButtonLabel(value = 6)
    comptime SQUARE = GamepadButtonLabel(value = 7)
    comptime TRIANGLE = GamepadButtonLabel(value = 8)


struct GamepadAxis(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadAxis
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GamepadAxis(value = -1)
    comptime LEFTX = GamepadAxis(value = 0)
    comptime LEFTY = GamepadAxis(value = 1)
    comptime RIGHTX = GamepadAxis(value = 2)
    comptime RIGHTY = GamepadAxis(value = 3)
    comptime LEFT_TRIGGER = GamepadAxis(value = 4)
    comptime RIGHT_TRIGGER = GamepadAxis(value = 5)
    comptime COUNT = GamepadAxis(value = 6)


struct GamepadBindingType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadBindingType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = GamepadBindingType(value = 0)
    comptime BUTTON = GamepadBindingType(value = 1)
    comptime AXIS = GamepadBindingType(value = 2)
    comptime HAT = GamepadBindingType(value = 3)


struct GPUPrimitiveType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUPrimitiveType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime TRIANGLELIST = GPUPrimitiveType(value = 0)
    comptime TRIANGLESTRIP = GPUPrimitiveType(value = 1)
    comptime LINELIST = GPUPrimitiveType(value = 2)
    comptime LINESTRIP = GPUPrimitiveType(value = 3)
    comptime POINTLIST = GPUPrimitiveType(value = 4)


struct GPULoadOp(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPULoadOp
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime LOAD = GPULoadOp(value = 0)
    comptime CLEAR = GPULoadOp(value = 1)
    comptime DONT_CARE = GPULoadOp(value = 2)


struct GPUStoreOp(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUStoreOp
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime STORE = GPUStoreOp(value = 0)
    comptime DONT_CARE = GPUStoreOp(value = 1)
    comptime RESOLVE = GPUStoreOp(value = 2)
    comptime RESOLVE_AND_STORE = GPUStoreOp(value = 3)


struct GPUIndexElementSize(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUIndexElementSize
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime N_16BIT = GPUIndexElementSize(value = 0)
    comptime N_32BIT = GPUIndexElementSize(value = 1)


struct GPUTextureFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUTextureFormat(value = 0)
    comptime A8_UNORM = GPUTextureFormat(value = 1)
    comptime R8_UNORM = GPUTextureFormat(value = 2)
    comptime R8G8_UNORM = GPUTextureFormat(value = 3)
    comptime R8G8B8A8_UNORM = GPUTextureFormat(value = 4)
    comptime R16_UNORM = GPUTextureFormat(value = 5)
    comptime R16G16_UNORM = GPUTextureFormat(value = 6)
    comptime R16G16B16A16_UNORM = GPUTextureFormat(value = 7)
    comptime R10G10B10A2_UNORM = GPUTextureFormat(value = 8)
    comptime B5G6R5_UNORM = GPUTextureFormat(value = 9)
    comptime B5G5R5A1_UNORM = GPUTextureFormat(value = 10)
    comptime B4G4R4A4_UNORM = GPUTextureFormat(value = 11)
    comptime B8G8R8A8_UNORM = GPUTextureFormat(value = 12)
    comptime BC1_RGBA_UNORM = GPUTextureFormat(value = 13)
    comptime BC2_RGBA_UNORM = GPUTextureFormat(value = 14)
    comptime BC3_RGBA_UNORM = GPUTextureFormat(value = 15)
    comptime BC4_R_UNORM = GPUTextureFormat(value = 16)
    comptime BC5_RG_UNORM = GPUTextureFormat(value = 17)
    comptime BC7_RGBA_UNORM = GPUTextureFormat(value = 18)
    comptime BC6H_RGB_FLOAT = GPUTextureFormat(value = 19)
    comptime BC6H_RGB_UFLOAT = GPUTextureFormat(value = 20)
    comptime R8_SNORM = GPUTextureFormat(value = 21)
    comptime R8G8_SNORM = GPUTextureFormat(value = 22)
    comptime R8G8B8A8_SNORM = GPUTextureFormat(value = 23)
    comptime R16_SNORM = GPUTextureFormat(value = 24)
    comptime R16G16_SNORM = GPUTextureFormat(value = 25)
    comptime R16G16B16A16_SNORM = GPUTextureFormat(value = 26)
    comptime R16_FLOAT = GPUTextureFormat(value = 27)
    comptime R16G16_FLOAT = GPUTextureFormat(value = 28)
    comptime R16G16B16A16_FLOAT = GPUTextureFormat(value = 29)
    comptime R32_FLOAT = GPUTextureFormat(value = 30)
    comptime R32G32_FLOAT = GPUTextureFormat(value = 31)
    comptime R32G32B32A32_FLOAT = GPUTextureFormat(value = 32)
    comptime R11G11B10_UFLOAT = GPUTextureFormat(value = 33)
    comptime R8_UINT = GPUTextureFormat(value = 34)
    comptime R8G8_UINT = GPUTextureFormat(value = 35)
    comptime R8G8B8A8_UINT = GPUTextureFormat(value = 36)
    comptime R16_UINT = GPUTextureFormat(value = 37)
    comptime R16G16_UINT = GPUTextureFormat(value = 38)
    comptime R16G16B16A16_UINT = GPUTextureFormat(value = 39)
    comptime R32_UINT = GPUTextureFormat(value = 40)
    comptime R32G32_UINT = GPUTextureFormat(value = 41)
    comptime R32G32B32A32_UINT = GPUTextureFormat(value = 42)
    comptime R8_INT = GPUTextureFormat(value = 43)
    comptime R8G8_INT = GPUTextureFormat(value = 44)
    comptime R8G8B8A8_INT = GPUTextureFormat(value = 45)
    comptime R16_INT = GPUTextureFormat(value = 46)
    comptime R16G16_INT = GPUTextureFormat(value = 47)
    comptime R16G16B16A16_INT = GPUTextureFormat(value = 48)
    comptime R32_INT = GPUTextureFormat(value = 49)
    comptime R32G32_INT = GPUTextureFormat(value = 50)
    comptime R32G32B32A32_INT = GPUTextureFormat(value = 51)
    comptime R8G8B8A8_UNORM_SRGB = GPUTextureFormat(value = 52)
    comptime B8G8R8A8_UNORM_SRGB = GPUTextureFormat(value = 53)
    comptime BC1_RGBA_UNORM_SRGB = GPUTextureFormat(value = 54)
    comptime BC2_RGBA_UNORM_SRGB = GPUTextureFormat(value = 55)
    comptime BC3_RGBA_UNORM_SRGB = GPUTextureFormat(value = 56)
    comptime BC7_RGBA_UNORM_SRGB = GPUTextureFormat(value = 57)
    comptime D16_UNORM = GPUTextureFormat(value = 58)
    comptime D24_UNORM = GPUTextureFormat(value = 59)
    comptime D32_FLOAT = GPUTextureFormat(value = 60)
    comptime D24_UNORM_S8_UINT = GPUTextureFormat(value = 61)
    comptime D32_FLOAT_S8_UINT = GPUTextureFormat(value = 62)
    comptime ASTC_4x4_UNORM = GPUTextureFormat(value = 63)
    comptime ASTC_5x4_UNORM = GPUTextureFormat(value = 64)
    comptime ASTC_5x5_UNORM = GPUTextureFormat(value = 65)
    comptime ASTC_6x5_UNORM = GPUTextureFormat(value = 66)
    comptime ASTC_6x6_UNORM = GPUTextureFormat(value = 67)
    comptime ASTC_8x5_UNORM = GPUTextureFormat(value = 68)
    comptime ASTC_8x6_UNORM = GPUTextureFormat(value = 69)
    comptime ASTC_8x8_UNORM = GPUTextureFormat(value = 70)
    comptime ASTC_10x5_UNORM = GPUTextureFormat(value = 71)
    comptime ASTC_10x6_UNORM = GPUTextureFormat(value = 72)
    comptime ASTC_10x8_UNORM = GPUTextureFormat(value = 73)
    comptime ASTC_10x10_UNORM = GPUTextureFormat(value = 74)
    comptime ASTC_12x10_UNORM = GPUTextureFormat(value = 75)
    comptime ASTC_12x12_UNORM = GPUTextureFormat(value = 76)
    comptime ASTC_4x4_UNORM_SRGB = GPUTextureFormat(value = 77)
    comptime ASTC_5x4_UNORM_SRGB = GPUTextureFormat(value = 78)
    comptime ASTC_5x5_UNORM_SRGB = GPUTextureFormat(value = 79)
    comptime ASTC_6x5_UNORM_SRGB = GPUTextureFormat(value = 80)
    comptime ASTC_6x6_UNORM_SRGB = GPUTextureFormat(value = 81)
    comptime ASTC_8x5_UNORM_SRGB = GPUTextureFormat(value = 82)
    comptime ASTC_8x6_UNORM_SRGB = GPUTextureFormat(value = 83)
    comptime ASTC_8x8_UNORM_SRGB = GPUTextureFormat(value = 84)
    comptime ASTC_10x5_UNORM_SRGB = GPUTextureFormat(value = 85)
    comptime ASTC_10x6_UNORM_SRGB = GPUTextureFormat(value = 86)
    comptime ASTC_10x8_UNORM_SRGB = GPUTextureFormat(value = 87)
    comptime ASTC_10x10_UNORM_SRGB = GPUTextureFormat(value = 88)
    comptime ASTC_12x10_UNORM_SRGB = GPUTextureFormat(value = 89)
    comptime ASTC_12x12_UNORM_SRGB = GPUTextureFormat(value = 90)
    comptime ASTC_4x4_FLOAT = GPUTextureFormat(value = 91)
    comptime ASTC_5x4_FLOAT = GPUTextureFormat(value = 92)
    comptime ASTC_5x5_FLOAT = GPUTextureFormat(value = 93)
    comptime ASTC_6x5_FLOAT = GPUTextureFormat(value = 94)
    comptime ASTC_6x6_FLOAT = GPUTextureFormat(value = 95)
    comptime ASTC_8x5_FLOAT = GPUTextureFormat(value = 96)
    comptime ASTC_8x6_FLOAT = GPUTextureFormat(value = 97)
    comptime ASTC_8x8_FLOAT = GPUTextureFormat(value = 98)
    comptime ASTC_10x5_FLOAT = GPUTextureFormat(value = 99)
    comptime ASTC_10x6_FLOAT = GPUTextureFormat(value = 100)
    comptime ASTC_10x8_FLOAT = GPUTextureFormat(value = 101)
    comptime ASTC_10x10_FLOAT = GPUTextureFormat(value = 102)
    comptime ASTC_12x10_FLOAT = GPUTextureFormat(value = 103)
    comptime ASTC_12x12_FLOAT = GPUTextureFormat(value = 104)


struct GPUTextureType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime N_2D = GPUTextureType(value = 0)
    comptime N_2D_ARRAY = GPUTextureType(value = 1)
    comptime N_3D = GPUTextureType(value = 2)
    comptime CUBE = GPUTextureType(value = 3)
    comptime CUBE_ARRAY = GPUTextureType(value = 4)


struct GPUSampleCount(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSampleCount
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime N_1 = GPUSampleCount(value = 0)
    comptime N_2 = GPUSampleCount(value = 1)
    comptime N_4 = GPUSampleCount(value = 2)
    comptime N_8 = GPUSampleCount(value = 3)


struct GPUCubeMapFace(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUCubeMapFace
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime POSITIVEX = GPUCubeMapFace(value = 0)
    comptime NEGATIVEX = GPUCubeMapFace(value = 1)
    comptime POSITIVEY = GPUCubeMapFace(value = 2)
    comptime NEGATIVEY = GPUCubeMapFace(value = 3)
    comptime POSITIVEZ = GPUCubeMapFace(value = 4)
    comptime NEGATIVEZ = GPUCubeMapFace(value = 5)


struct GPUTransferBufferUsage(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTransferBufferUsage
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UPLOAD = GPUTransferBufferUsage(value = 0)
    comptime DOWNLOAD = GPUTransferBufferUsage(value = 1)


struct GPUShaderStage(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUShaderStage
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime VERTEX = GPUShaderStage(value = 0)
    comptime FRAGMENT = GPUShaderStage(value = 1)


struct GPUVertexElementFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVertexElementFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUVertexElementFormat(value = 0)
    comptime INT = GPUVertexElementFormat(value = 1)
    comptime INT2 = GPUVertexElementFormat(value = 2)
    comptime INT3 = GPUVertexElementFormat(value = 3)
    comptime INT4 = GPUVertexElementFormat(value = 4)
    comptime UINT = GPUVertexElementFormat(value = 5)
    comptime UINT2 = GPUVertexElementFormat(value = 6)
    comptime UINT3 = GPUVertexElementFormat(value = 7)
    comptime UINT4 = GPUVertexElementFormat(value = 8)
    comptime FLOAT = GPUVertexElementFormat(value = 9)
    comptime FLOAT2 = GPUVertexElementFormat(value = 10)
    comptime FLOAT3 = GPUVertexElementFormat(value = 11)
    comptime FLOAT4 = GPUVertexElementFormat(value = 12)
    comptime BYTE2 = GPUVertexElementFormat(value = 13)
    comptime BYTE4 = GPUVertexElementFormat(value = 14)
    comptime UBYTE2 = GPUVertexElementFormat(value = 15)
    comptime UBYTE4 = GPUVertexElementFormat(value = 16)
    comptime BYTE2_NORM = GPUVertexElementFormat(value = 17)
    comptime BYTE4_NORM = GPUVertexElementFormat(value = 18)
    comptime UBYTE2_NORM = GPUVertexElementFormat(value = 19)
    comptime UBYTE4_NORM = GPUVertexElementFormat(value = 20)
    comptime SHORT2 = GPUVertexElementFormat(value = 21)
    comptime SHORT4 = GPUVertexElementFormat(value = 22)
    comptime USHORT2 = GPUVertexElementFormat(value = 23)
    comptime USHORT4 = GPUVertexElementFormat(value = 24)
    comptime SHORT2_NORM = GPUVertexElementFormat(value = 25)
    comptime SHORT4_NORM = GPUVertexElementFormat(value = 26)
    comptime USHORT2_NORM = GPUVertexElementFormat(value = 27)
    comptime USHORT4_NORM = GPUVertexElementFormat(value = 28)
    comptime HALF2 = GPUVertexElementFormat(value = 29)
    comptime HALF4 = GPUVertexElementFormat(value = 30)


struct GPUVertexInputRate(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVertexInputRate
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime VERTEX = GPUVertexInputRate(value = 0)
    comptime INSTANCE = GPUVertexInputRate(value = 1)


struct GPUFillMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUFillMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime FILL = GPUFillMode(value = 0)
    comptime LINE = GPUFillMode(value = 1)


struct GPUCullMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUCullMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = GPUCullMode(value = 0)
    comptime FRONT = GPUCullMode(value = 1)
    comptime BACK = GPUCullMode(value = 2)


struct GPUFrontFace(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUFrontFace
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime OUNTER_CLOCKWISE = GPUFrontFace(value = 0)
    comptime LOCKWISE = GPUFrontFace(value = 1)


struct GPUCompareOp(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUCompareOp
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUCompareOp(value = 0)
    comptime NEVER = GPUCompareOp(value = 1)
    comptime LESS = GPUCompareOp(value = 2)
    comptime EQUAL = GPUCompareOp(value = 3)
    comptime LESS_OR_EQUAL = GPUCompareOp(value = 4)
    comptime GREATER = GPUCompareOp(value = 5)
    comptime NOT_EQUAL = GPUCompareOp(value = 6)
    comptime GREATER_OR_EQUAL = GPUCompareOp(value = 7)
    comptime ALWAYS = GPUCompareOp(value = 8)


struct GPUStencilOp(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUStencilOp
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUStencilOp(value = 0)
    comptime KEEP = GPUStencilOp(value = 1)
    comptime ZERO = GPUStencilOp(value = 2)
    comptime REPLACE = GPUStencilOp(value = 3)
    comptime INCREMENT_AND_CLAMP = GPUStencilOp(value = 4)
    comptime DECREMENT_AND_CLAMP = GPUStencilOp(value = 5)
    comptime INVERT = GPUStencilOp(value = 6)
    comptime INCREMENT_AND_WRAP = GPUStencilOp(value = 7)
    comptime DECREMENT_AND_WRAP = GPUStencilOp(value = 8)


struct GPUBlendOp(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBlendOp
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUBlendOp(value = 0)
    comptime ADD = GPUBlendOp(value = 1)
    comptime SUBTRACT = GPUBlendOp(value = 2)
    comptime REVERSE_SUBTRACT = GPUBlendOp(value = 3)
    comptime MIN = GPUBlendOp(value = 4)
    comptime MAX = GPUBlendOp(value = 5)


struct GPUBlendFactor(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBlendFactor
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = GPUBlendFactor(value = 0)
    comptime ZERO = GPUBlendFactor(value = 1)
    comptime ONE = GPUBlendFactor(value = 2)
    comptime SRC_COLOR = GPUBlendFactor(value = 3)
    comptime ONE_MINUS_SRC_COLOR = GPUBlendFactor(value = 4)
    comptime DST_COLOR = GPUBlendFactor(value = 5)
    comptime ONE_MINUS_DST_COLOR = GPUBlendFactor(value = 6)
    comptime SRC_ALPHA = GPUBlendFactor(value = 7)
    comptime ONE_MINUS_SRC_ALPHA = GPUBlendFactor(value = 8)
    comptime DST_ALPHA = GPUBlendFactor(value = 9)
    comptime ONE_MINUS_DST_ALPHA = GPUBlendFactor(value = 10)
    comptime CONSTANT_COLOR = GPUBlendFactor(value = 11)
    comptime ONE_MINUS_CONSTANT_COLOR = GPUBlendFactor(value = 12)
    comptime SRC_ALPHA_SATURATE = GPUBlendFactor(value = 13)


struct GPUFilter(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUFilter
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NEAREST = GPUFilter(value = 0)
    comptime LINEAR = GPUFilter(value = 1)


struct GPUSamplerMipmapMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSamplerMipmapMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NEAREST = GPUSamplerMipmapMode(value = 0)
    comptime LINEAR = GPUSamplerMipmapMode(value = 1)


struct GPUSamplerAddressMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSamplerAddressMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime REPEAT = GPUSamplerAddressMode(value = 0)
    comptime MIRRORED_REPEAT = GPUSamplerAddressMode(value = 1)
    comptime CLAMP_TO_EDGE = GPUSamplerAddressMode(value = 2)


struct GPUPresentMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUPresentMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime VSYNC = GPUPresentMode(value = 0)
    comptime IMMEDIATE = GPUPresentMode(value = 1)
    comptime MAILBOX = GPUPresentMode(value = 2)


struct GPUSwapchainComposition(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSwapchainComposition
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime SDR = GPUSwapchainComposition(value = 0)
    comptime SDR_LINEAR = GPUSwapchainComposition(value = 1)
    comptime HDR_EXTENDED_LINEAR = GPUSwapchainComposition(value = 2)
    comptime HDR10_ST2084 = GPUSwapchainComposition(value = 3)


struct HintPriority(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HintPriority
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime DEFAULT = HintPriority(value = 0)
    comptime NORMAL = HintPriority(value = 1)
    comptime OVERRIDE = HintPriority(value = 2)


struct AppResult(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AppResult
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime CONTINUE = AppResult(value = 0)
    comptime SUCCESS = AppResult(value = 1)
    comptime FAILURE = AppResult(value = 2)


struct IOStatus(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOStatus
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime READY = IOStatus(value = 0)
    comptime ERROR = IOStatus(value = 1)
    comptime EOF = IOStatus(value = 2)
    comptime NOT_READY = IOStatus(value = 3)
    comptime READONLY = IOStatus(value = 4)
    comptime WRITEONLY = IOStatus(value = 5)


struct IOWhence(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOWhence
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime SET = IOWhence(value = 0)
    comptime CUR = IOWhence(value = 1)
    comptime END = IOWhence(value = 2)


struct JoystickType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoystickType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = JoystickType(value = 0)
    comptime GAMEPAD = JoystickType(value = 1)
    comptime WHEEL = JoystickType(value = 2)
    comptime ARCADE_STICK = JoystickType(value = 3)
    comptime FLIGHT_STICK = JoystickType(value = 4)
    comptime DANCE_PAD = JoystickType(value = 5)
    comptime GUITAR = JoystickType(value = 6)
    comptime DRUM_KIT = JoystickType(value = 7)
    comptime ARCADE_PAD = JoystickType(value = 8)
    comptime THROTTLE = JoystickType(value = 9)
    comptime COUNT = JoystickType(value = 10)


struct JoystickConnectionState(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoystickConnectionState
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = JoystickConnectionState(value = -1)
    comptime UNKNOWN = JoystickConnectionState(value = 0)
    comptime WIRED = JoystickConnectionState(value = 1)
    comptime WIRELESS = JoystickConnectionState(value = 2)


struct TextInputType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextInputType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime TEXT = TextInputType(value = 0)
    comptime TEXT_NAME = TextInputType(value = 1)
    comptime TEXT_EMAIL = TextInputType(value = 2)
    comptime TEXT_USERNAME = TextInputType(value = 3)
    comptime TEXT_PASSWORD_HIDDEN = TextInputType(value = 4)
    comptime TEXT_PASSWORD_VISIBLE = TextInputType(value = 5)
    comptime NUMBER = TextInputType(value = 6)
    comptime NUMBER_PASSWORD_HIDDEN = TextInputType(value = 7)
    comptime NUMBER_PASSWORD_VISIBLE = TextInputType(value = 8)


struct Capitalization(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Capitalization
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = Capitalization(value = 0)
    comptime SENTENCES = Capitalization(value = 1)
    comptime WORDS = Capitalization(value = 2)
    comptime LETTERS = Capitalization(value = 3)


struct LogCategory(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogCategory
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime APPLICATION = LogCategory(value = 0)
    comptime ERROR = LogCategory(value = 1)
    comptime ASSERT = LogCategory(value = 2)
    comptime SYSTEM = LogCategory(value = 3)
    comptime AUDIO = LogCategory(value = 4)
    comptime VIDEO = LogCategory(value = 5)
    comptime RENDER = LogCategory(value = 6)
    comptime INPUT = LogCategory(value = 7)
    comptime TEST = LogCategory(value = 8)
    comptime GPU = LogCategory(value = 9)
    comptime RESERVED2 = LogCategory(value = 10)
    comptime RESERVED3 = LogCategory(value = 11)
    comptime RESERVED4 = LogCategory(value = 12)
    comptime RESERVED5 = LogCategory(value = 13)
    comptime RESERVED6 = LogCategory(value = 14)
    comptime RESERVED7 = LogCategory(value = 15)
    comptime RESERVED8 = LogCategory(value = 16)
    comptime RESERVED9 = LogCategory(value = 17)
    comptime RESERVED10 = LogCategory(value = 18)
    comptime CUSTOM = LogCategory(value = 19)


struct LogPriority(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogPriority
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = LogPriority(value = 0)
    comptime TRACE = LogPriority(value = 1)
    comptime VERBOSE = LogPriority(value = 2)
    comptime DEBUG = LogPriority(value = 3)
    comptime INFO = LogPriority(value = 4)
    comptime WARN = LogPriority(value = 5)
    comptime ERROR = LogPriority(value = 6)
    comptime CRITICAL = LogPriority(value = 7)
    comptime COUNT = LogPriority(value = 8)


struct SystemCursor(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SystemCursor
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime DEFAULT = SystemCursor(value = 0)
    comptime TEXT = SystemCursor(value = 1)
    comptime WAIT = SystemCursor(value = 2)
    comptime CROSSHAIR = SystemCursor(value = 3)
    comptime PROGRESS = SystemCursor(value = 4)
    comptime NWSE_RESIZE = SystemCursor(value = 5)
    comptime NESW_RESIZE = SystemCursor(value = 6)
    comptime EW_RESIZE = SystemCursor(value = 7)
    comptime NS_RESIZE = SystemCursor(value = 8)
    comptime MOVE = SystemCursor(value = 9)
    comptime NOT_ALLOWED = SystemCursor(value = 10)
    comptime POINTER = SystemCursor(value = 11)
    comptime NW_RESIZE = SystemCursor(value = 12)
    comptime N_RESIZE = SystemCursor(value = 13)
    comptime NE_RESIZE = SystemCursor(value = 14)
    comptime E_RESIZE = SystemCursor(value = 15)
    comptime SE_RESIZE = SystemCursor(value = 16)
    comptime S_RESIZE = SystemCursor(value = 17)
    comptime SW_RESIZE = SystemCursor(value = 18)
    comptime W_RESIZE = SystemCursor(value = 19)
    comptime COUNT = SystemCursor(value = 20)


struct MouseWheelDirection(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MouseWheelDirection
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NORMAL = MouseWheelDirection(value = 0)
    comptime FLIPPED = MouseWheelDirection(value = 1)


struct PenAxis(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenAxis
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime PRESSURE = PenAxis(value = 0)
    comptime XTILT = PenAxis(value = 1)
    comptime YTILT = PenAxis(value = 2)
    comptime DISTANCE = PenAxis(value = 3)
    comptime ROTATION = PenAxis(value = 4)
    comptime SLIDER = PenAxis(value = 5)
    comptime TANGENTIAL_PRESSURE = PenAxis(value = 6)
    comptime COUNT = PenAxis(value = 7)


struct PenDeviceType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenDeviceType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = PenDeviceType(value = -1)
    comptime UNKNOWN = PenDeviceType(value = 0)
    comptime DIRECT = PenDeviceType(value = 1)
    comptime INDIRECT = PenDeviceType(value = 2)


struct PixelType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PixelType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = PixelType(value = 0)
    comptime INDEX1 = PixelType(value = 1)
    comptime INDEX4 = PixelType(value = 2)
    comptime INDEX8 = PixelType(value = 3)
    comptime PACKED8 = PixelType(value = 4)
    comptime PACKED16 = PixelType(value = 5)
    comptime PACKED32 = PixelType(value = 6)
    comptime ARRAYU8 = PixelType(value = 7)
    comptime ARRAYU16 = PixelType(value = 8)
    comptime ARRAYU32 = PixelType(value = 9)
    comptime ARRAYF16 = PixelType(value = 10)
    comptime ARRAYF32 = PixelType(value = 11)
    comptime INDEX2 = PixelType(value = 12)


struct BitmapOrder(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BitmapOrder
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = BitmapOrder(value = 0)
    comptime N_4321 = BitmapOrder(value = 1)
    comptime N_1234 = BitmapOrder(value = 2)


struct PackedOrder(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PackedOrder
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = PackedOrder(value = 0)
    comptime XRGB = PackedOrder(value = 1)
    comptime RGBX = PackedOrder(value = 2)
    comptime ARGB = PackedOrder(value = 3)
    comptime RGBA = PackedOrder(value = 4)
    comptime XBGR = PackedOrder(value = 5)
    comptime BGRX = PackedOrder(value = 6)
    comptime ABGR = PackedOrder(value = 7)
    comptime BGRA = PackedOrder(value = 8)


struct ArrayOrder(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ArrayOrder
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = ArrayOrder(value = 0)
    comptime RGB = ArrayOrder(value = 1)
    comptime RGBA = ArrayOrder(value = 2)
    comptime ARGB = ArrayOrder(value = 3)
    comptime BGR = ArrayOrder(value = 4)
    comptime BGRA = ArrayOrder(value = 5)
    comptime ABGR = ArrayOrder(value = 6)


struct PackedLayout(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PackedLayout
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = PackedLayout(value = 0)
    comptime N_332 = PackedLayout(value = 1)
    comptime N_4444 = PackedLayout(value = 2)
    comptime N_1555 = PackedLayout(value = 3)
    comptime N_5551 = PackedLayout(value = 4)
    comptime N_565 = PackedLayout(value = 5)
    comptime N_8888 = PackedLayout(value = 6)
    comptime N_2101010 = PackedLayout(value = 7)
    comptime N_1010102 = PackedLayout(value = 8)


struct PixelFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PixelFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = PixelFormat(value = 0)
    comptime INDEX1LSB = PixelFormat(value = 286261504)
    comptime INDEX1MSB = PixelFormat(value = 287310080)
    comptime INDEX2LSB = PixelFormat(value = 470811136)
    comptime INDEX2MSB = PixelFormat(value = 471859712)
    comptime INDEX4LSB = PixelFormat(value = 303039488)
    comptime INDEX4MSB = PixelFormat(value = 304088064)
    comptime INDEX8 = PixelFormat(value = 318769153)
    comptime RGB332 = PixelFormat(value = 336660481)
    comptime XRGB4444 = PixelFormat(value = 353504258)
    comptime XBGR4444 = PixelFormat(value = 357698562)
    comptime XRGB1555 = PixelFormat(value = 353570562)
    comptime XBGR1555 = PixelFormat(value = 357764866)
    comptime ARGB4444 = PixelFormat(value = 355602434)
    comptime RGBA4444 = PixelFormat(value = 356651010)
    comptime ABGR4444 = PixelFormat(value = 359796738)
    comptime BGRA4444 = PixelFormat(value = 360845314)
    comptime ARGB1555 = PixelFormat(value = 355667970)
    comptime RGBA5551 = PixelFormat(value = 356782082)
    comptime ABGR1555 = PixelFormat(value = 359862274)
    comptime BGRA5551 = PixelFormat(value = 360976386)
    comptime RGB565 = PixelFormat(value = 353701890)
    comptime BGR565 = PixelFormat(value = 357896194)
    comptime RGB24 = PixelFormat(value = 386930691)
    comptime BGR24 = PixelFormat(value = 390076419)
    comptime XRGB8888 = PixelFormat(value = 370546692)
    comptime RGBX8888 = PixelFormat(value = 371595268)
    comptime XBGR8888 = PixelFormat(value = 374740996)
    comptime BGRX8888 = PixelFormat(value = 375789572)
    comptime ARGB8888 = PixelFormat(value = 372645892)
    comptime RGBA8888 = PixelFormat(value = 373694468)
    comptime ABGR8888 = PixelFormat(value = 376840196)
    comptime BGRA8888 = PixelFormat(value = 377888772)
    comptime XRGB2101010 = PixelFormat(value = 370614276)
    comptime XBGR2101010 = PixelFormat(value = 374808580)
    comptime ARGB2101010 = PixelFormat(value = 372711428)
    comptime ABGR2101010 = PixelFormat(value = 376905732)
    comptime RGB48 = PixelFormat(value = 403714054)
    comptime BGR48 = PixelFormat(value = 406859782)
    comptime RGBA64 = PixelFormat(value = 404766728)
    comptime ARGB64 = PixelFormat(value = 405815304)
    comptime BGRA64 = PixelFormat(value = 407912456)
    comptime ABGR64 = PixelFormat(value = 408961032)
    comptime RGB48_FLOAT = PixelFormat(value = 437268486)
    comptime BGR48_FLOAT = PixelFormat(value = 440414214)
    comptime RGBA64_FLOAT = PixelFormat(value = 438321160)
    comptime ARGB64_FLOAT = PixelFormat(value = 439369736)
    comptime BGRA64_FLOAT = PixelFormat(value = 441466888)
    comptime ABGR64_FLOAT = PixelFormat(value = 442515464)
    comptime RGB96_FLOAT = PixelFormat(value = 454057996)
    comptime BGR96_FLOAT = PixelFormat(value = 457203724)
    comptime RGBA128_FLOAT = PixelFormat(value = 455114768)
    comptime ARGB128_FLOAT = PixelFormat(value = 456163344)
    comptime BGRA128_FLOAT = PixelFormat(value = 458260496)
    comptime ABGR128_FLOAT = PixelFormat(value = 459309072)
    comptime YV12 = PixelFormat(value = 842094169)
    comptime IYUV = PixelFormat(value = 1448433993)
    comptime YUY2 = PixelFormat(value = 844715353)
    comptime UYVY = PixelFormat(value = 1498831189)
    comptime YVYU = PixelFormat(value = 1431918169)
    comptime NV12 = PixelFormat(value = 842094158)
    comptime NV21 = PixelFormat(value = 825382478)
    comptime P010 = PixelFormat(value = 808530000)
    comptime EXTERNAL_OES = PixelFormat(value = 542328143)
    comptime MJPG = PixelFormat(value = 1196444237)
    comptime RGBA32 = PixelFormat(value = 376840196)
    comptime ARGB32 = PixelFormat(value = 377888772)
    comptime BGRA32 = PixelFormat(value = 372645892)
    comptime ABGR32 = PixelFormat(value = 373694468)
    comptime RGBX32 = PixelFormat(value = 374740996)
    comptime XRGB32 = PixelFormat(value = 375789572)
    comptime BGRX32 = PixelFormat(value = 370546692)
    comptime XBGR32 = PixelFormat(value = 371595268)


struct ColorType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ColorType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = ColorType(value = 0)
    comptime RGB = ColorType(value = 1)
    comptime YCBCR = ColorType(value = 2)


struct ColorRange(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ColorRange
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = ColorRange(value = 0)
    comptime LIMITED = ColorRange(value = 1)
    comptime FULL = ColorRange(value = 2)


struct ColorPrimaries(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ColorPrimaries
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = ColorPrimaries(value = 0)
    comptime BT709 = ColorPrimaries(value = 1)
    comptime UNSPECIFIED = ColorPrimaries(value = 2)
    comptime BT470M = ColorPrimaries(value = 4)
    comptime BT470BG = ColorPrimaries(value = 5)
    comptime BT601 = ColorPrimaries(value = 6)
    comptime SMPTE240 = ColorPrimaries(value = 7)
    comptime GENERIC_FILM = ColorPrimaries(value = 8)
    comptime BT2020 = ColorPrimaries(value = 9)
    comptime XYZ = ColorPrimaries(value = 10)
    comptime SMPTE431 = ColorPrimaries(value = 11)
    comptime SMPTE432 = ColorPrimaries(value = 12)
    comptime EBU3213 = ColorPrimaries(value = 22)
    comptime CUSTOM = ColorPrimaries(value = 31)


struct TransferCharacteristics(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TransferCharacteristics
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = TransferCharacteristics(value = 0)
    comptime BT709 = TransferCharacteristics(value = 1)
    comptime UNSPECIFIED = TransferCharacteristics(value = 2)
    comptime GAMMA22 = TransferCharacteristics(value = 4)
    comptime GAMMA28 = TransferCharacteristics(value = 5)
    comptime BT601 = TransferCharacteristics(value = 6)
    comptime SMPTE240 = TransferCharacteristics(value = 7)
    comptime LINEAR = TransferCharacteristics(value = 8)
    comptime LOG100 = TransferCharacteristics(value = 9)
    comptime LOG100_SQRT10 = TransferCharacteristics(value = 10)
    comptime IEC61966 = TransferCharacteristics(value = 11)
    comptime BT1361 = TransferCharacteristics(value = 12)
    comptime SRGB = TransferCharacteristics(value = 13)
    comptime BT2020_10BIT = TransferCharacteristics(value = 14)
    comptime BT2020_12BIT = TransferCharacteristics(value = 15)
    comptime PQ = TransferCharacteristics(value = 16)
    comptime SMPTE428 = TransferCharacteristics(value = 17)
    comptime HLG = TransferCharacteristics(value = 18)
    comptime CUSTOM = TransferCharacteristics(value = 31)


struct MatrixCoefficients(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MatrixCoefficients
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime IDENTITY = MatrixCoefficients(value = 0)
    comptime BT709 = MatrixCoefficients(value = 1)
    comptime UNSPECIFIED = MatrixCoefficients(value = 2)
    comptime FCC = MatrixCoefficients(value = 4)
    comptime BT470BG = MatrixCoefficients(value = 5)
    comptime BT601 = MatrixCoefficients(value = 6)
    comptime SMPTE240 = MatrixCoefficients(value = 7)
    comptime YCGCO = MatrixCoefficients(value = 8)
    comptime BT2020_NCL = MatrixCoefficients(value = 9)
    comptime BT2020_CL = MatrixCoefficients(value = 10)
    comptime SMPTE2085 = MatrixCoefficients(value = 11)
    comptime CHROMA_DERIVED_NCL = MatrixCoefficients(value = 12)
    comptime CHROMA_DERIVED_CL = MatrixCoefficients(value = 13)
    comptime ICTCP = MatrixCoefficients(value = 14)
    comptime CUSTOM = MatrixCoefficients(value = 31)


struct ChromaLocation(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ChromaLocation
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = ChromaLocation(value = 0)
    comptime LEFT = ChromaLocation(value = 1)
    comptime CENTER = ChromaLocation(value = 2)
    comptime TOPLEFT = ChromaLocation(value = 3)


struct Colorspace(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Colorspace
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = Colorspace(value = 0)
    comptime SRGB = Colorspace(value = 301991328)
    comptime SRGB_LINEAR = Colorspace(value = 301991168)
    comptime HDR10 = Colorspace(value = 301999616)
    comptime JPEG = Colorspace(value = 570426566)
    comptime BT601_LIMITED = Colorspace(value = 554703046)
    comptime BT601_FULL = Colorspace(value = 571480262)
    comptime BT709_LIMITED = Colorspace(value = 554697761)
    comptime BT709_FULL = Colorspace(value = 571474977)
    comptime BT2020_LIMITED = Colorspace(value = 554706441)
    comptime BT2020_FULL = Colorspace(value = 571483657)
    comptime RGB_DEFAULT = Colorspace(value = 301991328)
    comptime YUV_DEFAULT = Colorspace(value = 554703046)


struct PowerState(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PowerState
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime ERROR = PowerState(value = -1)
    comptime UNKNOWN = PowerState(value = 0)
    comptime ON_BATTERY = PowerState(value = 1)
    comptime NO_BATTERY = PowerState(value = 2)
    comptime CHARGING = PowerState(value = 3)
    comptime CHARGED = PowerState(value = 4)


struct PropertyType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PropertyType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = PropertyType(value = 0)
    comptime POINTER = PropertyType(value = 1)
    comptime STRING = PropertyType(value = 2)
    comptime NUMBER = PropertyType(value = 3)
    comptime FLOAT = PropertyType(value = 4)
    comptime BOOLEAN = PropertyType(value = 5)


struct TextureAccess(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextureAccess
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime STATIC = TextureAccess(value = 0)
    comptime STREAMING = TextureAccess(value = 1)
    comptime TARGET = TextureAccess(value = 2)


struct TextureAddressMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextureAddressMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TextureAddressMode(value = -1)
    comptime AUTO = TextureAddressMode(value = 0)
    comptime CLAMP = TextureAddressMode(value = 1)
    comptime WRAP = TextureAddressMode(value = 2)


struct RendererLogicalPresentation(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RendererLogicalPresentation
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime DISABLED = RendererLogicalPresentation(value = 0)
    comptime STRETCH = RendererLogicalPresentation(value = 1)
    comptime LETTERBOX = RendererLogicalPresentation(value = 2)
    comptime OVERSCAN = RendererLogicalPresentation(value = 3)
    comptime INTEGER_SCALE = RendererLogicalPresentation(value = 4)


struct Scancode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Scancode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = Scancode(value = 0)
    comptime A = Scancode(value = 4)
    comptime B = Scancode(value = 5)
    comptime C = Scancode(value = 6)
    comptime D = Scancode(value = 7)
    comptime E = Scancode(value = 8)
    comptime F = Scancode(value = 9)
    comptime G = Scancode(value = 10)
    comptime H = Scancode(value = 11)
    comptime I = Scancode(value = 12)
    comptime J = Scancode(value = 13)
    comptime K = Scancode(value = 14)
    comptime L = Scancode(value = 15)
    comptime M = Scancode(value = 16)
    comptime N = Scancode(value = 17)
    comptime O = Scancode(value = 18)
    comptime P = Scancode(value = 19)
    comptime Q = Scancode(value = 20)
    comptime R = Scancode(value = 21)
    comptime S = Scancode(value = 22)
    comptime T = Scancode(value = 23)
    comptime U = Scancode(value = 24)
    comptime V = Scancode(value = 25)
    comptime W = Scancode(value = 26)
    comptime X = Scancode(value = 27)
    comptime Y = Scancode(value = 28)
    comptime Z = Scancode(value = 29)
    comptime N_1 = Scancode(value = 30)
    comptime N_2 = Scancode(value = 31)
    comptime N_3 = Scancode(value = 32)
    comptime N_4 = Scancode(value = 33)
    comptime N_5 = Scancode(value = 34)
    comptime N_6 = Scancode(value = 35)
    comptime N_7 = Scancode(value = 36)
    comptime N_8 = Scancode(value = 37)
    comptime N_9 = Scancode(value = 38)
    comptime N_0 = Scancode(value = 39)
    comptime RETURN = Scancode(value = 40)
    comptime ESCAPE = Scancode(value = 41)
    comptime BACKSPACE = Scancode(value = 42)
    comptime TAB = Scancode(value = 43)
    comptime SPACE = Scancode(value = 44)
    comptime MINUS = Scancode(value = 45)
    comptime EQUALS = Scancode(value = 46)
    comptime LEFTBRACKET = Scancode(value = 47)
    comptime RIGHTBRACKET = Scancode(value = 48)
    comptime BACKSLASH = Scancode(value = 49)
    comptime NONUSHASH = Scancode(value = 50)
    comptime SEMICOLON = Scancode(value = 51)
    comptime APOSTROPHE = Scancode(value = 52)
    comptime GRAVE = Scancode(value = 53)
    comptime COMMA = Scancode(value = 54)
    comptime PERIOD = Scancode(value = 55)
    comptime SLASH = Scancode(value = 56)
    comptime CAPSLOCK = Scancode(value = 57)
    comptime F1 = Scancode(value = 58)
    comptime F2 = Scancode(value = 59)
    comptime F3 = Scancode(value = 60)
    comptime F4 = Scancode(value = 61)
    comptime F5 = Scancode(value = 62)
    comptime F6 = Scancode(value = 63)
    comptime F7 = Scancode(value = 64)
    comptime F8 = Scancode(value = 65)
    comptime F9 = Scancode(value = 66)
    comptime F10 = Scancode(value = 67)
    comptime F11 = Scancode(value = 68)
    comptime F12 = Scancode(value = 69)
    comptime PRINTSCREEN = Scancode(value = 70)
    comptime SCROLLLOCK = Scancode(value = 71)
    comptime PAUSE = Scancode(value = 72)
    comptime INSERT = Scancode(value = 73)
    comptime HOME = Scancode(value = 74)
    comptime PAGEUP = Scancode(value = 75)
    comptime DELETE = Scancode(value = 76)
    comptime END = Scancode(value = 77)
    comptime PAGEDOWN = Scancode(value = 78)
    comptime RIGHT = Scancode(value = 79)
    comptime LEFT = Scancode(value = 80)
    comptime DOWN = Scancode(value = 81)
    comptime UP = Scancode(value = 82)
    comptime NUMLOCKCLEAR = Scancode(value = 83)
    comptime KP_DIVIDE = Scancode(value = 84)
    comptime KP_MULTIPLY = Scancode(value = 85)
    comptime KP_MINUS = Scancode(value = 86)
    comptime KP_PLUS = Scancode(value = 87)
    comptime KP_ENTER = Scancode(value = 88)
    comptime KP_1 = Scancode(value = 89)
    comptime KP_2 = Scancode(value = 90)
    comptime KP_3 = Scancode(value = 91)
    comptime KP_4 = Scancode(value = 92)
    comptime KP_5 = Scancode(value = 93)
    comptime KP_6 = Scancode(value = 94)
    comptime KP_7 = Scancode(value = 95)
    comptime KP_8 = Scancode(value = 96)
    comptime KP_9 = Scancode(value = 97)
    comptime KP_0 = Scancode(value = 98)
    comptime KP_PERIOD = Scancode(value = 99)
    comptime NONUSBACKSLASH = Scancode(value = 100)
    comptime APPLICATION = Scancode(value = 101)
    comptime POWER = Scancode(value = 102)
    comptime KP_EQUALS = Scancode(value = 103)
    comptime F13 = Scancode(value = 104)
    comptime F14 = Scancode(value = 105)
    comptime F15 = Scancode(value = 106)
    comptime F16 = Scancode(value = 107)
    comptime F17 = Scancode(value = 108)
    comptime F18 = Scancode(value = 109)
    comptime F19 = Scancode(value = 110)
    comptime F20 = Scancode(value = 111)
    comptime F21 = Scancode(value = 112)
    comptime F22 = Scancode(value = 113)
    comptime F23 = Scancode(value = 114)
    comptime F24 = Scancode(value = 115)
    comptime EXECUTE = Scancode(value = 116)
    comptime HELP = Scancode(value = 117)
    comptime MENU = Scancode(value = 118)
    comptime SELECT = Scancode(value = 119)
    comptime STOP = Scancode(value = 120)
    comptime AGAIN = Scancode(value = 121)
    comptime UNDO = Scancode(value = 122)
    comptime CUT = Scancode(value = 123)
    comptime COPY = Scancode(value = 124)
    comptime PASTE = Scancode(value = 125)
    comptime FIND = Scancode(value = 126)
    comptime MUTE = Scancode(value = 127)
    comptime VOLUMEUP = Scancode(value = 128)
    comptime VOLUMEDOWN = Scancode(value = 129)
    comptime KP_COMMA = Scancode(value = 133)
    comptime KP_EQUALSAS400 = Scancode(value = 134)
    comptime INTERNATIONAL1 = Scancode(value = 135)
    comptime INTERNATIONAL2 = Scancode(value = 136)
    comptime INTERNATIONAL3 = Scancode(value = 137)
    comptime INTERNATIONAL4 = Scancode(value = 138)
    comptime INTERNATIONAL5 = Scancode(value = 139)
    comptime INTERNATIONAL6 = Scancode(value = 140)
    comptime INTERNATIONAL7 = Scancode(value = 141)
    comptime INTERNATIONAL8 = Scancode(value = 142)
    comptime INTERNATIONAL9 = Scancode(value = 143)
    comptime LANG1 = Scancode(value = 144)
    comptime LANG2 = Scancode(value = 145)
    comptime LANG3 = Scancode(value = 146)
    comptime LANG4 = Scancode(value = 147)
    comptime LANG5 = Scancode(value = 148)
    comptime LANG6 = Scancode(value = 149)
    comptime LANG7 = Scancode(value = 150)
    comptime LANG8 = Scancode(value = 151)
    comptime LANG9 = Scancode(value = 152)
    comptime ALTERASE = Scancode(value = 153)
    comptime SYSREQ = Scancode(value = 154)
    comptime CANCEL = Scancode(value = 155)
    comptime CLEAR = Scancode(value = 156)
    comptime PRIOR = Scancode(value = 157)
    comptime RETURN2 = Scancode(value = 158)
    comptime SEPARATOR = Scancode(value = 159)
    comptime OUT = Scancode(value = 160)
    comptime OPER = Scancode(value = 161)
    comptime CLEARAGAIN = Scancode(value = 162)
    comptime CRSEL = Scancode(value = 163)
    comptime EXSEL = Scancode(value = 164)
    comptime KP_00 = Scancode(value = 176)
    comptime KP_000 = Scancode(value = 177)
    comptime THOUSANDSSEPARATOR = Scancode(value = 178)
    comptime DECIMALSEPARATOR = Scancode(value = 179)
    comptime CURRENCYUNIT = Scancode(value = 180)
    comptime CURRENCYSUBUNIT = Scancode(value = 181)
    comptime KP_LEFTPAREN = Scancode(value = 182)
    comptime KP_RIGHTPAREN = Scancode(value = 183)
    comptime KP_LEFTBRACE = Scancode(value = 184)
    comptime KP_RIGHTBRACE = Scancode(value = 185)
    comptime KP_TAB = Scancode(value = 186)
    comptime KP_BACKSPACE = Scancode(value = 187)
    comptime KP_A = Scancode(value = 188)
    comptime KP_B = Scancode(value = 189)
    comptime KP_C = Scancode(value = 190)
    comptime KP_D = Scancode(value = 191)
    comptime KP_E = Scancode(value = 192)
    comptime KP_F = Scancode(value = 193)
    comptime KP_XOR = Scancode(value = 194)
    comptime KP_POWER = Scancode(value = 195)
    comptime KP_PERCENT = Scancode(value = 196)
    comptime KP_LESS = Scancode(value = 197)
    comptime KP_GREATER = Scancode(value = 198)
    comptime KP_AMPERSAND = Scancode(value = 199)
    comptime KP_DBLAMPERSAND = Scancode(value = 200)
    comptime KP_VERTICALBAR = Scancode(value = 201)
    comptime KP_DBLVERTICALBAR = Scancode(value = 202)
    comptime KP_COLON = Scancode(value = 203)
    comptime KP_HASH = Scancode(value = 204)
    comptime KP_SPACE = Scancode(value = 205)
    comptime KP_AT = Scancode(value = 206)
    comptime KP_EXCLAM = Scancode(value = 207)
    comptime KP_MEMSTORE = Scancode(value = 208)
    comptime KP_MEMRECALL = Scancode(value = 209)
    comptime KP_MEMCLEAR = Scancode(value = 210)
    comptime KP_MEMADD = Scancode(value = 211)
    comptime KP_MEMSUBTRACT = Scancode(value = 212)
    comptime KP_MEMMULTIPLY = Scancode(value = 213)
    comptime KP_MEMDIVIDE = Scancode(value = 214)
    comptime KP_PLUSMINUS = Scancode(value = 215)
    comptime KP_CLEAR = Scancode(value = 216)
    comptime KP_CLEARENTRY = Scancode(value = 217)
    comptime KP_BINARY = Scancode(value = 218)
    comptime KP_OCTAL = Scancode(value = 219)
    comptime KP_DECIMAL = Scancode(value = 220)
    comptime KP_HEXADECIMAL = Scancode(value = 221)
    comptime LCTRL = Scancode(value = 224)
    comptime LSHIFT = Scancode(value = 225)
    comptime LALT = Scancode(value = 226)
    comptime LGUI = Scancode(value = 227)
    comptime RCTRL = Scancode(value = 228)
    comptime RSHIFT = Scancode(value = 229)
    comptime RALT = Scancode(value = 230)
    comptime RGUI = Scancode(value = 231)
    comptime MODE = Scancode(value = 257)
    comptime SLEEP = Scancode(value = 258)
    comptime WAKE = Scancode(value = 259)
    comptime CHANNEL_INCREMENT = Scancode(value = 260)
    comptime CHANNEL_DECREMENT = Scancode(value = 261)
    comptime MEDIA_PLAY = Scancode(value = 262)
    comptime MEDIA_PAUSE = Scancode(value = 263)
    comptime MEDIA_RECORD = Scancode(value = 264)
    comptime MEDIA_FAST_FORWARD = Scancode(value = 265)
    comptime MEDIA_REWIND = Scancode(value = 266)
    comptime MEDIA_NEXT_TRACK = Scancode(value = 267)
    comptime MEDIA_PREVIOUS_TRACK = Scancode(value = 268)
    comptime MEDIA_STOP = Scancode(value = 269)
    comptime MEDIA_EJECT = Scancode(value = 270)
    comptime MEDIA_PLAY_PAUSE = Scancode(value = 271)
    comptime MEDIA_SELECT = Scancode(value = 272)
    comptime AC_NEW = Scancode(value = 273)
    comptime AC_OPEN = Scancode(value = 274)
    comptime AC_CLOSE = Scancode(value = 275)
    comptime AC_EXIT = Scancode(value = 276)
    comptime AC_SAVE = Scancode(value = 277)
    comptime AC_PRINT = Scancode(value = 278)
    comptime AC_PROPERTIES = Scancode(value = 279)
    comptime AC_SEARCH = Scancode(value = 280)
    comptime AC_HOME = Scancode(value = 281)
    comptime AC_BACK = Scancode(value = 282)
    comptime AC_FORWARD = Scancode(value = 283)
    comptime AC_STOP = Scancode(value = 284)
    comptime AC_REFRESH = Scancode(value = 285)
    comptime AC_BOOKMARKS = Scancode(value = 286)
    comptime SOFTLEFT = Scancode(value = 287)
    comptime SOFTRIGHT = Scancode(value = 288)
    comptime CALL = Scancode(value = 289)
    comptime ENDCALL = Scancode(value = 290)
    comptime RESERVED = Scancode(value = 400)
    comptime COUNT = Scancode(value = 512)


struct SensorType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SensorType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = SensorType(value = -1)
    comptime UNKNOWN = SensorType(value = 0)
    comptime ACCEL = SensorType(value = 1)
    comptime GYRO = SensorType(value = 2)
    comptime ACCEL_L = SensorType(value = 3)
    comptime GYRO_L = SensorType(value = 4)
    comptime ACCEL_R = SensorType(value = 5)
    comptime GYRO_R = SensorType(value = 6)
    comptime COUNT = SensorType(value = 7)


struct ScaleMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScaleMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = ScaleMode(value = -1)
    comptime NEAREST = ScaleMode(value = 0)
    comptime LINEAR = ScaleMode(value = 1)
    comptime PIXELART = ScaleMode(value = 2)


struct FlipMode(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlipMode
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NONE = FlipMode(value = 0)
    comptime HORIZONTAL = FlipMode(value = 1)
    comptime VERTICAL = FlipMode(value = 2)
    comptime HORIZONTAL_AND_VERTICAL = FlipMode(value = 3)


struct DateFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DateFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime YYYYMMDD = DateFormat(value = 0)
    comptime DDMMYYYY = DateFormat(value = 1)
    comptime MMDDYYYY = DateFormat(value = 2)


struct TimeFormat(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeFormat
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime N_24HR = TimeFormat(value = 0)
    comptime N_12HR = TimeFormat(value = 1)


struct TouchDeviceType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TouchDeviceType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TouchDeviceType(value = -1)
    comptime DIRECT = TouchDeviceType(value = 0)
    comptime INDIRECT_ABSOLUTE = TouchDeviceType(value = 1)
    comptime INDIRECT_RELATIVE = TouchDeviceType(value = 2)


struct SystemTheme(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SystemTheme
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = SystemTheme(value = 0)
    comptime LIGHT = SystemTheme(value = 1)
    comptime DARK = SystemTheme(value = 2)


struct DisplayOrientation(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DisplayOrientation
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime UNKNOWN = DisplayOrientation(value = 0)
    comptime LANDSCAPE = DisplayOrientation(value = 1)
    comptime LANDSCAPE_FLIPPED = DisplayOrientation(value = 2)
    comptime PORTRAIT = DisplayOrientation(value = 3)
    comptime PORTRAIT_FLIPPED = DisplayOrientation(value = 4)


struct FlashOperation(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlashOperation
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime CANCEL = FlashOperation(value = 0)
    comptime BRIEFLY = FlashOperation(value = 1)
    comptime UNTIL_FOCUSED = FlashOperation(value = 2)


struct ProgressState(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ProgressState
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = ProgressState(value = -1)
    comptime NONE = ProgressState(value = 0)
    comptime INDETERMINATE = ProgressState(value = 1)
    comptime NORMAL = ProgressState(value = 2)
    comptime PAUSED = ProgressState(value = 3)
    comptime ERROR = ProgressState(value = 4)


struct GLAttr(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GLAttr
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime RED_SIZE = GLAttr(value = 0)
    comptime GREEN_SIZE = GLAttr(value = 1)
    comptime BLUE_SIZE = GLAttr(value = 2)
    comptime ALPHA_SIZE = GLAttr(value = 3)
    comptime BUFFER_SIZE = GLAttr(value = 4)
    comptime DOUBLEBUFFER = GLAttr(value = 5)
    comptime DEPTH_SIZE = GLAttr(value = 6)
    comptime STENCIL_SIZE = GLAttr(value = 7)
    comptime ACCUM_RED_SIZE = GLAttr(value = 8)
    comptime ACCUM_GREEN_SIZE = GLAttr(value = 9)
    comptime ACCUM_BLUE_SIZE = GLAttr(value = 10)
    comptime ACCUM_ALPHA_SIZE = GLAttr(value = 11)
    comptime STEREO = GLAttr(value = 12)
    comptime MULTISAMPLEBUFFERS = GLAttr(value = 13)
    comptime MULTISAMPLESAMPLES = GLAttr(value = 14)
    comptime ACCELERATED_VISUAL = GLAttr(value = 15)
    comptime RETAINED_BACKING = GLAttr(value = 16)
    comptime CONTEXT_MAJOR_VERSION = GLAttr(value = 17)
    comptime CONTEXT_MINOR_VERSION = GLAttr(value = 18)
    comptime CONTEXT_FLAGS = GLAttr(value = 19)
    comptime CONTEXT_PROFILE_MASK = GLAttr(value = 20)
    comptime SHARE_WITH_CURRENT_CONTEXT = GLAttr(value = 21)
    comptime FRAMEBUFFER_SRGB_CAPABLE = GLAttr(value = 22)
    comptime CONTEXT_RELEASE_BEHAVIOR = GLAttr(value = 23)
    comptime CONTEXT_RESET_NOTIFICATION = GLAttr(value = 24)
    comptime CONTEXT_NO_ERROR = GLAttr(value = 25)
    comptime FLOATBUFFERS = GLAttr(value = 26)
    comptime EGL_PLATFORM = GLAttr(value = 27)


struct HitTestResult(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HitTestResult
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime NORMAL = HitTestResult(value = 0)
    comptime DRAGGABLE = HitTestResult(value = 1)
    comptime RESIZE_TOPLEFT = HitTestResult(value = 2)
    comptime RESIZE_TOP = HitTestResult(value = 3)
    comptime RESIZE_TOPRIGHT = HitTestResult(value = 4)
    comptime RESIZE_RIGHT = HitTestResult(value = 5)
    comptime RESIZE_BOTTOMRIGHT = HitTestResult(value = 6)
    comptime RESIZE_BOTTOM = HitTestResult(value = 7)
    comptime RESIZE_BOTTOMLEFT = HitTestResult(value = 8)
    comptime RESIZE_LEFT = HitTestResult(value = 9)


struct IMG_AnimationDecoderStatus(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_AnimationDecoderStatus
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = IMG_AnimationDecoderStatus(value = -1)
    comptime OK = IMG_AnimationDecoderStatus(value = 0)
    comptime FAILED = IMG_AnimationDecoderStatus(value = 1)
    comptime COMPLETE = IMG_AnimationDecoderStatus(value = 2)


struct TTF_HintingFlags(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_HintingFlags
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TTF_HintingFlags(value = -1)
    comptime NORMAL = TTF_HintingFlags(value = 0)
    comptime LIGHT = TTF_HintingFlags(value = 1)
    comptime MONO = TTF_HintingFlags(value = 2)
    comptime NONE = TTF_HintingFlags(value = 3)
    comptime LIGHT_SUBPIXEL = TTF_HintingFlags(value = 4)


struct TTF_HorizontalAlignment(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_HorizontalAlignment
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TTF_HorizontalAlignment(value = -1)
    comptime LEFT = TTF_HorizontalAlignment(value = 0)
    comptime CENTER = TTF_HorizontalAlignment(value = 1)
    comptime RIGHT = TTF_HorizontalAlignment(value = 2)


struct TTF_Direction(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Direction
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TTF_Direction(value = 0)
    comptime LTR = TTF_Direction(value = 4)
    comptime RTL = TTF_Direction(value = 5)
    comptime TTB = TTF_Direction(value = 6)
    comptime BTT = TTF_Direction(value = 7)


struct TTF_ImageType(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_ImageType
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TTF_ImageType(value = 0)
    comptime ALPHA = TTF_ImageType(value = 1)
    comptime COLOR = TTF_ImageType(value = 2)
    comptime SDF = TTF_ImageType(value = 3)


struct TTF_GPUTextEngineWinding(TrivialRegisterType, Equatable, Intable, Indexer):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GPUTextEngineWinding
    """
    var value: Int32

    fn __init__(out self, *, value: Int32):
        self.value = value

    fn __eq__(self, rhs: Self) -> Bool:
        return self.value == rhs.value

    fn __int__(self) -> Int:
        return Int(self.value)

    fn __mlir_index__(self) -> __mlir_type.index:
        return self.__int__()._mlir_value

    comptime INVALID = TTF_GPUTextEngineWinding(value = -1)
    comptime CLOCKWISE = TTF_GPUTextEngineWinding(value = 0)
    comptime COUNTER_CLOCKWISE = TTF_GPUTextEngineWinding(value = 1)
