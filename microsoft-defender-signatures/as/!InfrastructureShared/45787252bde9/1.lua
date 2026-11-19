-- Threat: !InfrastructureShared
-- Name: 45787252bde9
-- Type: 21

if mp.getfilesize() < 65538 and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
