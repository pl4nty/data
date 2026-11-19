-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspiciousZip.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 30 then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(8, 2)
if l_0_1 ~= "\000\000" then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(headerpage, 19)
local l_0_3 = mp.readu_u32(headerpage, 23)
if l_0_2 ~= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
