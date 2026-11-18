-- Threat: !InfrastructureShared
-- Name: 8578e29615ef
-- Type: 21

local l_0_0 = mp.getfilesize()
if 151552 <= l_0_0 and l_0_0 <= 589824 then
  return mp.INFECTED
end
return mp.CLEAN
