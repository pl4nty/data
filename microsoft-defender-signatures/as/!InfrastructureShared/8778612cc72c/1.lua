-- Threat: !InfrastructureShared
-- Name: 8778612cc72c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
