-- Threat: !InfrastructureShared
-- Name: 4b781491e2a0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
