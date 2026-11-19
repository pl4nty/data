-- Threat: !InfrastructureShared
-- Name: 3478cf210620
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
