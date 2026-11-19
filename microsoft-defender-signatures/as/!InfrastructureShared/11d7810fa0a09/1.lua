-- Threat: !InfrastructureShared
-- Name: 11d7810fa0a09
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
