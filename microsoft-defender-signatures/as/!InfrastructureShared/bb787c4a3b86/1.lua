-- Threat: !InfrastructureShared
-- Name: bb787c4a3b86
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
