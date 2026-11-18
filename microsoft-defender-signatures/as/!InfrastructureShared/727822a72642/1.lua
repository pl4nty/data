-- Threat: !InfrastructureShared
-- Name: 727822a72642
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
