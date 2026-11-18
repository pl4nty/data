-- Threat: !InfrastructureShared
-- Name: 8178da1f47d3
-- Type: 21

if mp.getfilesize() < 520000 and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
