-- Threat: !InfrastructureShared
-- Name: 1c788883c5a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
