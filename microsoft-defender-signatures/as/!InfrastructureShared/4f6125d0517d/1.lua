-- Threat: !InfrastructureShared
-- Name: 4f6125d0517d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
