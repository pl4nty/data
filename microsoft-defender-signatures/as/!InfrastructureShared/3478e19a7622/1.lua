-- Threat: !InfrastructureShared
-- Name: 3478e19a7622
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
