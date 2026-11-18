-- Threat: !InfrastructureShared
-- Name: 3d7825c96e0f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.J") then
  return mp.INFECTED
end
return mp.CLEAN
