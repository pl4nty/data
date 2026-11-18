-- Threat: !InfrastructureShared
-- Name: aa78788c8262
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
