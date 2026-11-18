-- Threat: !InfrastructureShared
-- Name: ad7888007474
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
