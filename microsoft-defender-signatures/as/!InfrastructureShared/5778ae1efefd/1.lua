-- Threat: !InfrastructureShared
-- Name: 5778ae1efefd
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
