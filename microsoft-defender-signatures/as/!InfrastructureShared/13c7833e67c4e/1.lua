-- Threat: !InfrastructureShared
-- Name: 13c7833e67c4e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
