-- Threat: !InfrastructureShared
-- Name: 3478afbb9e82
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
