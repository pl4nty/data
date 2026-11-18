-- Threat: !InfrastructureShared
-- Name: a7783edca1d6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
