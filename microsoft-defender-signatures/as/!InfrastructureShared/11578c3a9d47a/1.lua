-- Threat: !InfrastructureShared
-- Name: 11578c3a9d47a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
