-- Threat: !InfrastructureShared
-- Name: 5c2937a1ecc5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 50 < l_0_0 and l_0_0 < 200 then
  return mp.INFECTED
end
return mp.CLEAN
