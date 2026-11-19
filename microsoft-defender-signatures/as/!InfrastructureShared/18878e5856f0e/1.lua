-- Threat: !InfrastructureShared
-- Name: 18878e5856f0e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
