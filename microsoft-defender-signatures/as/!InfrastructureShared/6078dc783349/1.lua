-- Threat: !InfrastructureShared
-- Name: 6078dc783349
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
