-- Threat: !InfrastructureShared
-- Name: 11778b7b85dc8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
