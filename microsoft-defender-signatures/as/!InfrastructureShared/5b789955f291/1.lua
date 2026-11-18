-- Threat: !InfrastructureShared
-- Name: 5b789955f291
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
