-- Threat: !InfrastructureShared
-- Name: c678621c9397
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
