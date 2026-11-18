-- Threat: !InfrastructureShared
-- Name: 8178a169f62f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
