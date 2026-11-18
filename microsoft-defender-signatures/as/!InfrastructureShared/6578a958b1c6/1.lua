-- Threat: !InfrastructureShared
-- Name: 6578a958b1c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
