-- Threat: !InfrastructureShared
-- Name: 6a61d04e6a9c
-- Type: 21

if mp.getfilesize() <= 972800 and mp.getfilesize() >= 665600 then
  return mp.INFECTED
end
return mp.CLEAN
