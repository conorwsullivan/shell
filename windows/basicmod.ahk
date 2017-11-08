;Convert Dvorak keystrokes to their correct letters on a QWERTY-configured OS
;Script instructions:
;Capslock toggles QWERTY or Dvorak mode
;Shift-Caps works like regular Caps
;Ctrl-Alt-Esc quits this script
;Made by BinarySplit <binarysplit at gmail>
 
#SingleInstance force
#MaxHotkeysPerInterval 100
#UseHook
Process, Priority,, Realtime
SetKeyDelay -1
 
-::[
=::]
q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=
a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
'::-
z::`;
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z

$BackSpace::CapsLock
$CapsLock::BackSpace

^F11::Suspend Toggle

$LCtrl::LAlt
$LAlt::LCtrl
