-- Threat: !InfrastructureShared
-- Name: 10c78c5a9f16a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
