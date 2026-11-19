-- Threat: !InfrastructureShared
-- Name: 24781e0603e1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
