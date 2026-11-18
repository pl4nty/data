-- Threat: !InfrastructureShared
-- Name: 437854d05152
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
