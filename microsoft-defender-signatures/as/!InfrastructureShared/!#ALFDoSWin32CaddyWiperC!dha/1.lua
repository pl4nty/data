-- Threat: !InfrastructureShared
-- Name: !#ALF:DoS:Win32/CaddyWiper.C!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A | LUA:FileSizeLE2000.A)

local l_0_0 = mp.readu_u32(headerpage, 1)
if l_0_0 < 2 or 5 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 5)
local l_0_2 = l_0_1 + 32
if l_0_2 > mp.HEADERPAGE_SZ or l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(headerpage, 9)
if l_0_2 < l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "U\139\236"
local l_0_5 = string.len(l_0_4)
local l_0_6 = 20
local l_0_7 = 0
local l_0_8 = mp.readheader(12, l_0_6)
for l_0_9 = 1, l_0_6 do
  _t = string.byte(l_0_8, l_0_9)
  l_0_7 = mp.bitxor(_t, l_0_7)
end
local l_0_10 = ""
local l_0_11 = ""
local l_0_12 = 0
local l_0_13 = mp.readheader(32, l_0_5)
for l_0_14 = 1, l_0_5 do
  l_0_12 = string.byte(l_0_13, l_0_14)
  l_0_11 = mp.bitxor(l_0_12, l_0_7)
  l_0_10 = l_0_10 .. string.char(l_0_11)
end
if l_0_10 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_15 = 0
local l_0_16 = mp.readheader(l_0_2 + 12, l_0_6)
for l_0_17 = 1, l_0_6 do
  l_0_12 = string.byte(l_0_16, l_0_17)
  l_0_15 = mp.bitxor(l_0_12, l_0_15)
end
local l_0_18 = ""
local l_0_19 = mp.readheader(l_0_2 + 32, l_0_5)
for l_0_20 = 1, l_0_5 do
  l_0_12 = string.byte(l_0_19, l_0_20)
  l_0_11 = mp.bitxor(l_0_12, l_0_15)
  l_0_18 = l_0_18 .. string.char(l_0_11)
end
if l_0_18 ~= l_0_4 then
  return mp.CLEAN
end
return mp.INFECTED
