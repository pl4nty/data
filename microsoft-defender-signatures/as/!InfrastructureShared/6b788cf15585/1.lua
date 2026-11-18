-- Threat: !InfrastructureShared
-- Name: 6b788cf15585
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
