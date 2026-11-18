-- Threat: !InfrastructureShared
-- Name: 6c786d8ab770
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
