-- Threat: !InfrastructureShared
-- Name: 3678601ea6f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
