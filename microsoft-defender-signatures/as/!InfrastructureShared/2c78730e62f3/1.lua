-- Threat: !InfrastructureShared
-- Name: 2c78730e62f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
