-- Threat: !InfrastructureShared
-- Name: 5878d581a6a8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
