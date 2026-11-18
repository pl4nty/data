-- Threat: !InfrastructureShared
-- Name: 4f29e2ea2ad0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 9472 < l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
