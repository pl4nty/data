-- Threat: !InfrastructureShared
-- Name: 68786d6c92ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
