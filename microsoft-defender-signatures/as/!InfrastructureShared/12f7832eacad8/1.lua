-- Threat: !InfrastructureShared
-- Name: 12f7832eacad8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
