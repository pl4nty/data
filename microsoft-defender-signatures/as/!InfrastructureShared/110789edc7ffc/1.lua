-- Threat: !InfrastructureShared
-- Name: 110789edc7ffc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
