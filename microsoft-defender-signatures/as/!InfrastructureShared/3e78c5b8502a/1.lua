-- Threat: !InfrastructureShared
-- Name: 3e78c5b8502a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.K") then
  return mp.INFECTED
end
return mp.CLEAN
