-- Threat: !InfrastructureShared
-- Name: 2978a2f1cb86
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
