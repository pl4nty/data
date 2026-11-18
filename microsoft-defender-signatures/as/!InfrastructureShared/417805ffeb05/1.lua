-- Threat: !InfrastructureShared
-- Name: 417805ffeb05
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
