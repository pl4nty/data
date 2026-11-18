-- Threat: !InfrastructureShared
-- Name: 2c78e9ba0846
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
