-- Threat: !InfrastructureShared
-- Name: 4d783240d347
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
