-- Threat: !InfrastructureShared
-- Name: 21785b248599
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
