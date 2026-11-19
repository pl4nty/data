-- Threat: !InfrastructureShared
-- Name: 161783b7c69d4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
