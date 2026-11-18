-- Threat: !InfrastructureShared
-- Name: 2a61d4cfee65
-- Type: 21

local l_0_0 = mp.getfilesize()
if 53248 <= l_0_0 and l_0_0 <= 57344 then
  return mp.INFECTED
end
return mp.CLEAN
