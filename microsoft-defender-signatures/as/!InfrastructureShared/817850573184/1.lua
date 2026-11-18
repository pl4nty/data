-- Threat: !InfrastructureShared
-- Name: 817850573184
-- Type: 21

if mp.getfilesize() < 9000 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
