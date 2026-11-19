-- Threat: !InfrastructureShared
-- Name: 2d61673db092
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 589824 < l_0_0 and l_0_0 < 720896 and mp.get_mpattribute("NID:Trojan:MSIL/TeslaCryptIH") then
  return mp.INFECTED
end
return mp.LOWFI
