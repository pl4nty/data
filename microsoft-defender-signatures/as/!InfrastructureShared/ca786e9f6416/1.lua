-- Threat: !InfrastructureShared
-- Name: ca786e9f6416
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
