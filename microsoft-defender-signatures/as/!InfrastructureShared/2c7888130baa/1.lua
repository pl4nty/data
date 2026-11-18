-- Threat: !InfrastructureShared
-- Name: 2c7888130baa
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
