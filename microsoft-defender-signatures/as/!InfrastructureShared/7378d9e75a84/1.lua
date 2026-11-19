-- Threat: !InfrastructureShared
-- Name: 7378d9e75a84
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
