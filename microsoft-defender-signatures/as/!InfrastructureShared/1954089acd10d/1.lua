-- Threat: !InfrastructureShared
-- Name: 1954089acd10d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
