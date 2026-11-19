-- Threat: !InfrastructureShared
-- Name: 2f78b3e569ae
-- Type: 21

if mp.getfilesize() < 125000 and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
