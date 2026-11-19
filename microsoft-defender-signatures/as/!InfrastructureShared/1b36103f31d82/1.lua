-- Threat: !InfrastructureShared
-- Name: 1b36103f31d82
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
