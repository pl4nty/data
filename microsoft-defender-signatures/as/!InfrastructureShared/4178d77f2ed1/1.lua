-- Threat: !InfrastructureShared
-- Name: 4178d77f2ed1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
