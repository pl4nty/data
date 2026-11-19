-- Threat: !InfrastructureShared
-- Name: 827840d10c61
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
