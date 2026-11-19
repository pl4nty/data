-- Threat: !InfrastructureShared
-- Name: 32785fd58ced
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
