-- Threat: !InfrastructureShared
-- Name: 43784f039cf7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
