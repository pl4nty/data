-- Threat: !InfrastructureShared
-- Name: 4478918d929b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and l_0_0 <= 2097152 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
