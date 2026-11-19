-- Threat: !InfrastructureShared
-- Name: 647822ae7d4f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
