-- Threat: !InfrastructureShared
-- Name: 4c788c7a2e91
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
