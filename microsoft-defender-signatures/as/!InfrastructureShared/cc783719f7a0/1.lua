-- Threat: !InfrastructureShared
-- Name: cc783719f7a0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 50097 then
  return mp.INFECTED
end
return mp.CLEAN
