-- Threat: !InfrastructureShared
-- Name: 33783dedf298
-- Type: 21

if mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
