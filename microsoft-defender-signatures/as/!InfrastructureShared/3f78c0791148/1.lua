-- Threat: !InfrastructureShared
-- Name: 3f78c0791148
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
