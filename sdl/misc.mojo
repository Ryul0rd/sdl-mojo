from memory import memset_zero, memcpy
from sys import size_of
from sys.info import CompilationTarget
from sys.ffi import  _get_global_or_null, _get_global
from math import ceildiv
from os import PathLike
from .enums import EventType, GamepadBindingType, GamepadButton, GamepadAxis


comptime Ptr = UnsafePointer


fn uninitialized[T: AnyType](out value: T):
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(value))


fn zero_init[T: AnyType](out value: T):
    value = uninitialized[T]()
    memset_zero(Ptr(to=value), 1)


# FunctionPointer is one of the only types we need in stdinc.h,
# which also has a bunch of junk so we just include it here manually.
comptime FunctionPointer = fn()
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_FunctionPointer
"""


# Time is also in stdinc.h
struct Time(ImplicitlyCopyable):
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_Time
    """
    var value: Int64

    fn __init__(out self, *, value: Int64):
        self.value = value


# Event is the only Union we need so we just hardcode it
struct Event(Copyable):
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_Event
    """
    var type: EventType               # EventType is 4 bytes
    var _data: InlineArray[Byte, 124] # SDL_Event is 128 bytes total

    fn __getitem__[T: AnyType](ref self) -> ref [self] T:
        return Ptr(to=self).bitcast[T]()[]


# GamepadBinding is the only struct that contains anonymous types so we just hardcode them
@fieldwise_init
struct GamepadBinding(Copyable):
    var input_type: GamepadBindingType
    var input: GamepadBindingInput
    var output_type: GamepadBindingType
    var output: GamepadBindingOutput


struct GamepadBindingInput(Copyable):
    comptime _size = max(
        size_of[Int32](),
        size_of[GamepadBindingInputAxis](),
        size_of[GamepadBindingOutputAxis](),
    )
    comptime _AlignType = UInt32
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, button: Int32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=button).bitcast[Byte](),
            count = size_of[Int32](),
        )

    fn __init__(out self, axis: GamepadBindingInputAxis):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=axis).bitcast[Byte](),
            count = size_of[GamepadBindingInputAxis](),
        )

    fn __init__(out self, hat: GamepadBindingInputHat):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=hat).bitcast[Byte](),
            count = size_of[GamepadBindingInputHat](),
        )


@fieldwise_init
struct GamepadBindingInputAxis(Copyable):
    var axis: Int32
    var axis_min: Int32
    var axis_max: Int32


@fieldwise_init
struct GamepadBindingInputHat(Copyable):
    var hat: Int32
    var hat_mask: Int32


struct GamepadBindingOutput(Copyable):
    comptime _size = max(
        size_of[GamepadButton](),
        size_of[GamepadBindingOutputAxis](),
    )
    comptime _AlignType = UInt32
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, button: GamepadButton):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=button).bitcast[Byte](),
            count = size_of[GamepadButton](),
        )

    fn __init__(out self, axis: GamepadBindingOutputAxis):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=axis).bitcast[Byte](),
            count = size_of[GamepadBindingOutputAxis](),
        )


@fieldwise_init
struct GamepadBindingOutputAxis(Copyable):
    var axis: GamepadAxis
    var axis_min: Int32
    var axis_max: Int32