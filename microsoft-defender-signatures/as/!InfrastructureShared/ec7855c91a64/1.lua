-- Threat: !InfrastructureShared
-- Name: ec7855c91a64
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
