-- Threat: !InfrastructureShared
-- Name: 75405c2def4a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
