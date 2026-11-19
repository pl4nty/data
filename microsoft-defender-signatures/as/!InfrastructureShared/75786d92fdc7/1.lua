-- Threat: !InfrastructureShared
-- Name: 75786d92fdc7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
