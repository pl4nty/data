-- Threat: !InfrastructureShared
-- Name: 8478bfe3be7b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
