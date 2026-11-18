-- Threat: !InfrastructureShared
-- Name: 2078b249c239
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
