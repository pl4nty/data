-- Threat: !InfrastructureShared
-- Name: 9778c76d101f
-- Type: 21

if mp.getfilesize() < 851968 then
  return mp.INFECTED
end
return mp.CLEAN
