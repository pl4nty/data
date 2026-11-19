-- Threat: !InfrastructureShared
-- Name: 10578481e4f75
-- Type: 21

if mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
