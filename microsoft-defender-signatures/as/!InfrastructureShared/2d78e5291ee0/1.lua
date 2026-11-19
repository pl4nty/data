-- Threat: !InfrastructureShared
-- Name: 2d78e5291ee0
-- Type: 21

if mp.getfilesize() < 2064000 then
  return mp.INFECTED
end
return mp.CLEAN
