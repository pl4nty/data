-- Threat: !InfrastructureShared
-- Name: 6278540318aa
-- Type: 21

if mp.getfilesize() < 520000 and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
