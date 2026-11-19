-- Threat: !InfrastructureShared
-- Name: a061945a9873
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 90112 < l_0_0 and l_0_0 < 524288 then
  return mp.INFECTED
end
return mp.CLEAN
