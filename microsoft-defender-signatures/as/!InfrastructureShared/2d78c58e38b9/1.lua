-- Threat: !InfrastructureShared
-- Name: 2d78c58e38b9
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.D") then
  return mp.INFECTED
end
return mp.CLEAN
