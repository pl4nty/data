-- Threat: !InfrastructureShared
-- Name: 7278e6e101f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
