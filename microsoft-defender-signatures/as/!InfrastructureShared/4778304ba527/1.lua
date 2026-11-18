-- Threat: !InfrastructureShared
-- Name: 4778304ba527
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
