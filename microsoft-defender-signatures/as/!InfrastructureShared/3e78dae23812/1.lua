-- Threat: !InfrastructureShared
-- Name: 3e78dae23812
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.C") then
  return mp.INFECTED
end
return mp.CLEAN
