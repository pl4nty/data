-- Threat: !InfrastructureShared
-- Name: 7c614fa2217d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and peattributes.ismsil == true and 12288 <= l_0_0 and l_0_0 <= 86016 then
  return mp.INFECTED
end
return mp.LOWFI
