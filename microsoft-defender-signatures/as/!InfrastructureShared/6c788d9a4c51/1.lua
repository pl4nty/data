-- Threat: !InfrastructureShared
-- Name: 6c788d9a4c51
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.A") then
  return mp.INFECTED
end
return mp.CLEAN
