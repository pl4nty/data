-- Threat: !InfrastructureShared
-- Name: 2029a5af443a
-- Type: 21

if mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
