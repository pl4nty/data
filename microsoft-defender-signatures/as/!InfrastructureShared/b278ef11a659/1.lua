-- Threat: !InfrastructureShared
-- Name: b278ef11a659
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
