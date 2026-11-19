-- Threat: !InfrastructureShared
-- Name: 4f780d117cbe
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
