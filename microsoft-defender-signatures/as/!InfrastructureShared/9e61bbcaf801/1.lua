-- Threat: !InfrastructureShared
-- Name: 9e61bbcaf801
-- Type: 21

if peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
