-- Threat: !InfrastructureShared
-- Name: 317870ede740
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
