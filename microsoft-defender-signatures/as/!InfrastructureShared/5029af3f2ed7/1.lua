-- Threat: !InfrastructureShared
-- Name: 5029af3f2ed7
-- Type: 21

if mp.getfilesize() <= 10240 and mp.getfilesize() > 7168 then
  return mp.INFECTED
end
return mp.CLEAN
