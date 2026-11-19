-- Threat: !InfrastructureShared
-- Name: 29784f053833
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
