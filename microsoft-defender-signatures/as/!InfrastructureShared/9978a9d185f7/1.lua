-- Threat: !InfrastructureShared
-- Name: 9978a9d185f7
-- Type: 21

if mp.getfilesize() <= 700000 and mp.getfilesize() >= 300000 then
  return mp.INFECTED
end
return mp.CLEAN
