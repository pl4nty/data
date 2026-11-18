-- Threat: !InfrastructureShared
-- Name: 3378a24a308d
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.G") then
  return mp.INFECTED
end
return mp.CLEAN
