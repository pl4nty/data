-- Threat: !InfrastructureShared
-- Name: ec7838e27468
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
