-- Threat: !InfrastructureShared
-- Name: 6578152b1973
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
