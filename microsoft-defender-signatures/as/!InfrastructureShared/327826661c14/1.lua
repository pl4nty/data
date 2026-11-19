-- Threat: !InfrastructureShared
-- Name: 327826661c14
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
