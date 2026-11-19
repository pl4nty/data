-- Threat: !InfrastructureShared
-- Name: 9478db8c01e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
