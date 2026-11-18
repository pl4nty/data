-- Threat: !InfrastructureShared
-- Name: 2477891e8bfcb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
