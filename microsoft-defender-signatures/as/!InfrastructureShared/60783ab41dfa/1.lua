-- Threat: !InfrastructureShared
-- Name: 60783ab41dfa
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
