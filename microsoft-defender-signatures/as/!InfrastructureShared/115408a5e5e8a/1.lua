-- Threat: !InfrastructureShared
-- Name: 115408a5e5e8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
