-- Threat: !InfrastructureShared
-- Name: 6b78739f948f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
