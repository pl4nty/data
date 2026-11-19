-- Threat: !InfrastructureShared
-- Name: 107783f442f21
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
