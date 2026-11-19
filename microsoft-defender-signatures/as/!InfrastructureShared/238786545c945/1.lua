-- Threat: !InfrastructureShared
-- Name: 238786545c945
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
