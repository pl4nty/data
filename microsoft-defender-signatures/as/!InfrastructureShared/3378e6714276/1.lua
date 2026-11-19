-- Threat: !InfrastructureShared
-- Name: 3378e6714276
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
