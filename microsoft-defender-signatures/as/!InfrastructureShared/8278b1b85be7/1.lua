-- Threat: !InfrastructureShared
-- Name: 8278b1b85be7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
