-- Threat: !InfrastructureShared
-- Name: d578e3f2cdad
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
