-- Threat: !InfrastructureShared
-- Name: b4781af8deae
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
