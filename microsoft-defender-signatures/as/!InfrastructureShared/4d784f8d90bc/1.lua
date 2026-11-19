-- Threat: !InfrastructureShared
-- Name: 4d784f8d90bc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
