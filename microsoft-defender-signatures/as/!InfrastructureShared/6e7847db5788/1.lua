-- Threat: !InfrastructureShared
-- Name: 6e7847db5788
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
