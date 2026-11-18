-- Threat: !InfrastructureShared
-- Name: 2e7866a2b42d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
