-- Threat: !InfrastructureShared
-- Name: b540f2650c47
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
