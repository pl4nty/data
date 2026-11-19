-- Threat: !InfrastructureShared
-- Name: 19e787feeee3d
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
