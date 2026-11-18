-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Uroburos.Q!dha
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 1)
if l_0_0 ~= mp.getfilesize() then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(44, 16)
if l_0_1 == "\254\255\255\255\001\000\000\000\v\000\000\000\001\000\000\000" then
  return mp.INFECTED
end
return mp.CLEAN
