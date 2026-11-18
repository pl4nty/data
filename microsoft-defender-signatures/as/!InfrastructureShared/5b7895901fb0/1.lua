-- Threat: !InfrastructureShared
-- Name: 5b7895901fb0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
