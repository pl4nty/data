-- Threat: !InfrastructureShared
-- Name: 387813c255f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
