-- Threat: !InfrastructureShared
-- Name: 11978a15f6a45
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
