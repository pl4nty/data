-- Threat: !InfrastructureShared
-- Name: 2c78dc125474
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
