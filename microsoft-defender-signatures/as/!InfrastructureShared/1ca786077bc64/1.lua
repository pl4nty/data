-- Threat: !InfrastructureShared
-- Name: 1ca786077bc64
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
