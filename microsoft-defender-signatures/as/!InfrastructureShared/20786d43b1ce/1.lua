-- Threat: !InfrastructureShared
-- Name: 20786d43b1ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
