-- Threat: !InfrastructureShared
-- Name: 977814dfd095
-- Type: 21

if peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
