-- Threat: !InfrastructureShared
-- Name: 4a78dc0f8389
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
