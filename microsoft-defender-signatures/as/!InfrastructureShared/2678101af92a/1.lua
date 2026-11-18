-- Threat: !InfrastructureShared
-- Name: 2678101af92a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.F") then
  return mp.INFECTED
end
return mp.CLEAN
