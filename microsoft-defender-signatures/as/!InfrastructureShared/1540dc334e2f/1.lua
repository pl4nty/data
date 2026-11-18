-- Threat: !InfrastructureShared
-- Name: 1540dc334e2f
-- Type: 21

if mp.getfilesize() < 675000 and mp.getfilesize() > 655000 then
  return mp.INFECTED
end
return mp.CLEAN
