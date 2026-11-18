-- Threat: !InfrastructureShared
-- Name: 577859097b25
-- Type: 21

if mp.getfilesize() < 16896 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
