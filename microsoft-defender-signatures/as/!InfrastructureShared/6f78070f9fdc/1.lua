-- Threat: !InfrastructureShared
-- Name: 6f78070f9fdc
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() < 22000 then
  return mp.INFECTED
end
return mp.CLEAN
