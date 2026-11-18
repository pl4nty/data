-- Threat: !InfrastructureShared
-- Name: 5861f10c0585
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
