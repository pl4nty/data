-- Threat: !InfrastructureShared
-- Name: 16a7851e3a759
-- Type: 21

if mp.getfilesize() >= 270800 and mp.getfilesize() <= 674000 then
  return mp.INFECTED
end
return mp.CLEAN
