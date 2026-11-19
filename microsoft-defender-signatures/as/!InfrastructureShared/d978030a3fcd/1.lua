-- Threat: !InfrastructureShared
-- Name: d978030a3fcd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
