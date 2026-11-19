-- Threat: !InfrastructureShared
-- Name: 4c78f884b2bb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
