-- Threat: !InfrastructureShared
-- Name: 377838d13edf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
