-- Threat: !InfrastructureShared
-- Name: d37878761fce
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
