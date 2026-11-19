-- Threat: !InfrastructureShared
-- Name: 23780c197a5f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3072000 then
  return mp.INFECTED
end
return mp.CLEAN
