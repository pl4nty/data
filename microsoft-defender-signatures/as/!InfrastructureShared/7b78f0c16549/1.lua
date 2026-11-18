-- Threat: !InfrastructureShared
-- Name: 7b78f0c16549
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
