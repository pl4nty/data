-- Threat: !InfrastructureShared
-- Name: 6a78a122958d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
