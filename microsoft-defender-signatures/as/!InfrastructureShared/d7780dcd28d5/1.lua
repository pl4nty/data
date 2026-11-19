-- Threat: !InfrastructureShared
-- Name: d7780dcd28d5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 10485760 then
  return mp.INFECTED
end
return mp.CLEAN
