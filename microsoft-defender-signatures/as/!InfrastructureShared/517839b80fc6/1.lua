-- Threat: !InfrastructureShared
-- Name: 517839b80fc6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
