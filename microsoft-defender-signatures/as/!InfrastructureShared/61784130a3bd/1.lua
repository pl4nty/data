-- Threat: !InfrastructureShared
-- Name: 61784130a3bd
-- Type: 21

if mp.getfilesize() > 10000000 and mp.getfilesize() < 12000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
