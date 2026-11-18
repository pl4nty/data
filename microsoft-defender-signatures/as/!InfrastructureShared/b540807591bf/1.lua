-- Threat: !InfrastructureShared
-- Name: b540807591bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
