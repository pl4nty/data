-- Threat: !InfrastructureShared
-- Name: 77782c394c73
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
