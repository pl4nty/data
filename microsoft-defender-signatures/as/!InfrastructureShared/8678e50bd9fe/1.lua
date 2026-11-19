-- Threat: !InfrastructureShared
-- Name: 8678e50bd9fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
