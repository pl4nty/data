-- Threat: !InfrastructureShared
-- Name: 1154080d69d46
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
