-- Threat: !InfrastructureShared
-- Name: 5978b13ac3ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
