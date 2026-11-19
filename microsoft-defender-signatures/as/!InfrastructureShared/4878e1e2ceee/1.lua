-- Threat: !InfrastructureShared
-- Name: 4878e1e2ceee
-- Type: 21

if mp.getfilesize() > 648000 and mp.getfilesize() < 1750000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
