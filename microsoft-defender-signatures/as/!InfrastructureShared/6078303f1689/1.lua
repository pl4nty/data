-- Threat: !InfrastructureShared
-- Name: 6078303f1689
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
