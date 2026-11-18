-- Threat: !InfrastructureShared
-- Name: 3978a00b85d4
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
