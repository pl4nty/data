-- Threat: !InfrastructureShared
-- Name: 2f789be90765
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() >= 487000 then
  return mp.INFECTED
end
return mp.CLEAN
