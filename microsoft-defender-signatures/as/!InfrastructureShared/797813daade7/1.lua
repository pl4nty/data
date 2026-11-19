-- Threat: !InfrastructureShared
-- Name: 797813daade7
-- Type: 21

if mp.getfilesize() > 4000000 and mp.getfilesize() < 6000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
