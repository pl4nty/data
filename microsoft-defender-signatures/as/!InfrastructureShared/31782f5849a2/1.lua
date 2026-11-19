-- Threat: !InfrastructureShared
-- Name: 31782f5849a2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
