-- Threat: !InfrastructureShared
-- Name: 20278803bdb19
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
