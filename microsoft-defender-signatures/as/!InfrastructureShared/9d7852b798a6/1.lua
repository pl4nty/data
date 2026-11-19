-- Threat: !InfrastructureShared
-- Name: 9d7852b798a6
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
