-- Threat: !InfrastructureShared
-- Name: 11f7845ed7f69
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
