-- Threat: !InfrastructureShared
-- Name: 7b783eeb8a45
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
