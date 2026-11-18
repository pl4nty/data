-- Threat: !InfrastructureShared
-- Name: 40782e594c7a
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
