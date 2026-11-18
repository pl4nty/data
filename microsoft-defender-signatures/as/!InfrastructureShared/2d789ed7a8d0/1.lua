-- Threat: !InfrastructureShared
-- Name: 2d789ed7a8d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
