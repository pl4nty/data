-- Threat: !InfrastructureShared
-- Name: 5878e20873d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
