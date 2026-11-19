-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ExtraTame.B!dha
-- Type: 13
-- MpAttributes: (LUA:FileSizeLE10000.A | LUA:FileSizeLE20000.A) & BM_UNKNOWN_FILE

if mp.HEADERPAGE_SZ < 4096 then
  return mp.CLEAN
end
if 4096 > mp.FOOTERPAGE_SZ then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) == 0 or mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - 4) == 0 then
  return mp.CLEAN
end
local l_0_0 = 10
local l_0_1 = 8
local l_0_2 = mp.readheader(0, l_0_1)
local l_0_3 = mp.readfooter(mp.FOOTERPAGE_SZ - l_0_0, l_0_0)
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = ""
for l_0_7 = 1, l_0_1 do
  l_0_5 = string.byte(l_0_2, l_0_7)
  for l_0_8 = 1, l_0_0 do
    l_0_4 = mp.bitand(string.byte(l_0_3, l_0_8) + (l_0_7 - 1) * (l_0_8 - 1), 255)
    l_0_5 = mp.bitxor(l_0_5, l_0_4)
  end
  l_0_6 = l_0_6 .. string.char(l_0_5)
end
if mp.readu_u32(l_0_6, 1) == mp.getfilesize() - 14 and mp.readu_u32(l_0_6, 5) == 9460301 then
  return mp.INFECTED
end
return mp.CLEAN
