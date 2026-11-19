-- Threat: !InfrastructureShared
-- Name: 1a77849171d9a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
