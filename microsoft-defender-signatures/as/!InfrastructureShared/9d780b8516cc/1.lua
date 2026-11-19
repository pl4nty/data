-- Threat: !InfrastructureShared
-- Name: 9d780b8516cc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
