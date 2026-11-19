-- Threat: \xadChopperShell.Z!ibt
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & LUA:FileSizeLE1000.A

local l_0_0 = mp.enum_mpattributesubstring("SCPT:HafniumShell")
if 6 <= #l_0_0 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
