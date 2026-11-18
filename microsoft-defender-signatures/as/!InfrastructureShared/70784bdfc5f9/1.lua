-- Threat: !InfrastructureShared
-- Name: 70784bdfc5f9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
