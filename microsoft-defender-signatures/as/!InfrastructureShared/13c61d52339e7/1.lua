-- Threat: !InfrastructureShared
-- Name: 13c61d52339e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
