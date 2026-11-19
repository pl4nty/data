-- Threat: !InfrastructureShared
-- Name: 4178d3eac1a5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
