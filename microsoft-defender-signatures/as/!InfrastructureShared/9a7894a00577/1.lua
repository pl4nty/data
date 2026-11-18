-- Threat: !InfrastructureShared
-- Name: 9a7894a00577
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
