-- Threat: !InfrastructureShared
-- Name: 44784dd1d994
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
