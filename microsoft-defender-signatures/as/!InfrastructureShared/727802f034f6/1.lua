-- Threat: !InfrastructureShared
-- Name: 727802f034f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
