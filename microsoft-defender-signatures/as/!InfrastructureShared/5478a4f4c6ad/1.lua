-- Threat: !InfrastructureShared
-- Name: 5478a4f4c6ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
