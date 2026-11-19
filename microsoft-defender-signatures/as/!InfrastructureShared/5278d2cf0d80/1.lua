-- Threat: !InfrastructureShared
-- Name: 5278d2cf0d80
-- Type: 21

if mp.getfilesize() > 16000 and mp.getfilesize() < 22000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
