-- Threat: !InfrastructureShared
-- Name: c07816767c46
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
