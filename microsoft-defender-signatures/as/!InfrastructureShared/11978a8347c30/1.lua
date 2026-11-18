-- Threat: !InfrastructureShared
-- Name: 11978a8347c30
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
