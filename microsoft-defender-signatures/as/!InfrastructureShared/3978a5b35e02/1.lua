-- Threat: !InfrastructureShared
-- Name: 3978a5b35e02
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
