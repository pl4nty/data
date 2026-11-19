-- Threat: !InfrastructureShared
-- Name: 5978b731723f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
