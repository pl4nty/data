-- Threat: !InfrastructureShared
-- Name: 55784b3e1970
-- Type: 21

if mp.getfilesize() >= 158720 and mp.getfilesize() <= 165888 then
  return mp.INFECTED
end
return mp.CLEAN
