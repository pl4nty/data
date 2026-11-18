-- Threat: !InfrastructureShared
-- Name: 35614a251505
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
