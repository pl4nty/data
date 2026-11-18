-- Threat: !InfrastructureShared
-- Name: de7863ea6ac2
-- Type: 21

if mp.getfilesize() > 40000 then
  return mp.INFECTED
end
return mp.CLEAN
