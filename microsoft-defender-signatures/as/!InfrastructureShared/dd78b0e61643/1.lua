-- Threat: !InfrastructureShared
-- Name: dd78b0e61643
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and pesecs[1].Name == ".xcc22eb" then
  return mp.INFECTED
end
return mp.CLEAN
