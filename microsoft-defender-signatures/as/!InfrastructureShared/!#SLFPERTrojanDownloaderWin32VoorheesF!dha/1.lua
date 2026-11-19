-- Threat: !InfrastructureShared
-- Name: !#SLFPER:TrojanDownloader:Win32/Voorhees.F!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if 14680064 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:VoorheesF")
if 3 <= #l_0_1 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
