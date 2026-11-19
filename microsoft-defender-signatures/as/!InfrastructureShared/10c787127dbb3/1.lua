-- Threat: !InfrastructureShared
-- Name: 10c787127dbb3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
