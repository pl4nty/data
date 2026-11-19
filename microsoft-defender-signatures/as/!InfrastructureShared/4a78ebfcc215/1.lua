-- Threat: !InfrastructureShared
-- Name: 4a78ebfcc215
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
