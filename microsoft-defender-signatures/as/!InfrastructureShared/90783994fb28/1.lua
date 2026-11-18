-- Threat: !InfrastructureShared
-- Name: 90783994fb28
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
