-- Threat: !InfrastructureShared
-- Name: 4d7843b8a77f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
