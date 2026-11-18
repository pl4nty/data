-- Threat: !InfrastructureShared
-- Name: 327824005f14
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
