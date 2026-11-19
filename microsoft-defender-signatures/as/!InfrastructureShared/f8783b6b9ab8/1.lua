-- Threat: !InfrastructureShared
-- Name: f8783b6b9ab8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
