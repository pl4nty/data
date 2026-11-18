-- Threat: !InfrastructureShared
-- Name: 6178e6cc89b7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
