-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Underaxe.B!dha
-- Type: 13

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u16(headerpage, 1)
local l_0_1 = mp.readu_u16(headerpage, 3)
if l_0_0 == 0 or l_0_1 == 0 or l_0_0 + 8 > mp.HEADERPAGE_SZ or l_0_1 > mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, l_0_0 + 1) == 610044232 and mp.readu_u32(headerpage, l_0_0 + 5) == 1465275656 and headerpage[l_0_1] == 195 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
