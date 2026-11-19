-- Threat: !InfrastructureShared
-- Name: 73786f2c2247
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
