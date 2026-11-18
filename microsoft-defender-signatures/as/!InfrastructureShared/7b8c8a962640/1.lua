-- Threat: !InfrastructureShared
-- Name: 7b8c8a962640
-- Type: 21

if mp.getfilesize() >= 487424 and mp.getfilesize() <= 626688 then
  return mp.INFECTED
end
return mp.CLEAN
