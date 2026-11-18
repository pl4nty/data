-- Threat: !InfrastructureShared
-- Name: 51784bb9aa86
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
