-- Threat: !InfrastructureShared
-- Name: 8f785897fe71
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
