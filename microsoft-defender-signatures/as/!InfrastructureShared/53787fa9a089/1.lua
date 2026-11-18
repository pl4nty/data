-- Threat: !InfrastructureShared
-- Name: 53787fa9a089
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
