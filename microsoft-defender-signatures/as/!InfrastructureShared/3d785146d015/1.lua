-- Threat: !InfrastructureShared
-- Name: 3d785146d015
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.N") then
  return mp.INFECTED
end
return mp.CLEAN
