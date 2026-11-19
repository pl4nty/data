-- Threat: !InfrastructureShared
-- Name: 3c78871d6d31
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
