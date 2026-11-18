-- Threat: !InfrastructureShared
-- Name: 5540f74e4b2c
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
