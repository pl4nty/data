-- Threat: !InfrastructureShared
-- Name: 4978b85357bb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
