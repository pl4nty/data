-- Threat: \xac!KeySnipe.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 5242880 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 1)
local l_0_2 = mp.readu_u32(headerpage, 5)
if l_0_1 == 0 or l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(headerpage, 33)
if mp.bitxor(l_0_1, l_0_3) ~= 9460301 then
  return mp.CLEAN
end
local l_0_4 = ""
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 32
local l_0_9 = 64
local l_0_10 = mp.readheader(0, l_0_8)
local l_0_11 = mp.readheader(l_0_8, l_0_9)
for l_0_12 = 1, l_0_9 do
  l_0_5 = string.byte(l_0_11, l_0_12)
  l_0_6 = string.byte(l_0_10, (l_0_12 - 1) % l_0_8 + 1)
  l_0_7 = mp.bitxor(l_0_5, l_0_6)
  l_0_4 = l_0_4 .. string.char(l_0_7)
end
local l_0_13 = 41
local l_0_14 = 61
if string.sub(l_0_4, 0, 16) == "MZ\144\000\003\000\000\000\004\000\000\000\255\255\000\000" and string.sub(l_0_4, l_0_13, l_0_9 - 4) == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" and mp.readu_u32(l_0_4, l_0_14) < 512 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
