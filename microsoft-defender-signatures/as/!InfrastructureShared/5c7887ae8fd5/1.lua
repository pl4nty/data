-- Threat: !InfrastructureShared
-- Name: 5c7887ae8fd5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
