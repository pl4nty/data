-- Threat: !InfrastructureShared
-- Name: 7378d2b92e96
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
