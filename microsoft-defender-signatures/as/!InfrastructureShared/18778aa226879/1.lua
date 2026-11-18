-- Threat: !InfrastructureShared
-- Name: 18778aa226879
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
