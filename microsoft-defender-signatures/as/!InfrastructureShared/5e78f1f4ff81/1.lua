-- Threat: !InfrastructureShared
-- Name: 5e78f1f4ff81
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
