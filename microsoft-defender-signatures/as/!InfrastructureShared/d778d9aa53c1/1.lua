-- Threat: !InfrastructureShared
-- Name: d778d9aa53c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
