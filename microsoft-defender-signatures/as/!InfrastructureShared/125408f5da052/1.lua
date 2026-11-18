-- Threat: !InfrastructureShared
-- Name: 125408f5da052
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
