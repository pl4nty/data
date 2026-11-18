-- Threat: !InfrastructureShared
-- Name: 61781996844f
-- Type: 21

if mp.getfilesize() > 13000000 and mp.getfilesize() < 21000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
