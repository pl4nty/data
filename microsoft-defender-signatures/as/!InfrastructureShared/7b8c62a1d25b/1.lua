-- Threat: !InfrastructureShared
-- Name: 7b8c62a1d25b
-- Type: 21

if mp.getfilesize() > 5500000 then
  return mp.INFECTED
end
return mp.CLEAN
