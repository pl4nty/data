-- Threat: !InfrastructureShared
-- Name: 7dbe125ed549
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 80000 then
  return mp.INFECTED
end
return mp.CLEAN
