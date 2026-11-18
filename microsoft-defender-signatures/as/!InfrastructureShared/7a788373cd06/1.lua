-- Threat: !InfrastructureShared
-- Name: 7a788373cd06
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
