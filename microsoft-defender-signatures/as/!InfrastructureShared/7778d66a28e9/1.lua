-- Threat: !InfrastructureShared
-- Name: 7778d66a28e9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
