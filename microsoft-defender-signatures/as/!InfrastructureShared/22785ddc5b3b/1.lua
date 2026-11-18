-- Threat: !InfrastructureShared
-- Name: 22785ddc5b3b
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.P") then
  return mp.INFECTED
end
return mp.CLEAN
