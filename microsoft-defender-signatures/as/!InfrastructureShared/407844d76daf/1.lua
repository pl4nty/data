-- Threat: !InfrastructureShared
-- Name: 407844d76daf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
