-- Threat: !InfrastructureShared
-- Name: 4c7840696f24
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
