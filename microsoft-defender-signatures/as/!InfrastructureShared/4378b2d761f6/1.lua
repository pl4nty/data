-- Threat: !InfrastructureShared
-- Name: 4378b2d761f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
