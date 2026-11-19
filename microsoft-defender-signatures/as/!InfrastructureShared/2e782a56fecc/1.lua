-- Threat: !InfrastructureShared
-- Name: 2e782a56fecc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
