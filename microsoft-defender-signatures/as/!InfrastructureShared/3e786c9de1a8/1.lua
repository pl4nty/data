-- Threat: !InfrastructureShared
-- Name: 3e786c9de1a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
