-- Threat: !InfrastructureShared
-- Name: 6e6186e2d32c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 20480 and mp.getfilesize() <= 36864 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
