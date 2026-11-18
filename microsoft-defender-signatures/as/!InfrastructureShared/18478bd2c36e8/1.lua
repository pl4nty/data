-- Threat: !InfrastructureShared
-- Name: 18478bd2c36e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
