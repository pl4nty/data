-- Threat: !InfrastructureShared
-- Name: 5778a532de42
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 147458 then
  return mp.INFECTED
end
return mp.CLEAN
