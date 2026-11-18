-- Threat: !InfrastructureShared
-- Name: 2a78a5b6dd84
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
