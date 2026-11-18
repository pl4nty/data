-- Threat: !InfrastructureShared
-- Name: c178fc4f3d69
-- Type: 21

if mp.getfilesize() < 11000 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
