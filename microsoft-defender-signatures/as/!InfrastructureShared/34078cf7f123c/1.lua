-- Threat: !InfrastructureShared
-- Name: 34078cf7f123c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
