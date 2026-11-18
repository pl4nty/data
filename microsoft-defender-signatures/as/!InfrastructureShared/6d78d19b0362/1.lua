-- Threat: !InfrastructureShared
-- Name: 6d78d19b0362
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
