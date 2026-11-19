-- Threat: !InfrastructureShared
-- Name: 59789495e3ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
