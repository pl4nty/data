-- Threat: !InfrastructureShared
-- Name: f3784c17b527
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
