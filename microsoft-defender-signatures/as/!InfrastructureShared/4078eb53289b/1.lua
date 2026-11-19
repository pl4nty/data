-- Threat: !InfrastructureShared
-- Name: 4078eb53289b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
