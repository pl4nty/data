-- Threat: !InfrastructureShared
-- Name: 948f97111889
-- Type: 21

if mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
