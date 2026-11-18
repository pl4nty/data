-- Threat: !InfrastructureShared
-- Name: 5978f1900e2b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
