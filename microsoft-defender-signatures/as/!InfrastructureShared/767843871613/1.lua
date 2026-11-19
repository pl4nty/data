-- Threat: !InfrastructureShared
-- Name: 767843871613
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
