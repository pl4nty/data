-- Threat: !InfrastructureShared
-- Name: 52786bf00b05
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
