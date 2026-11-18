-- Threat: !InfrastructureShared
-- Name: a5400ece8fa2
-- Type: 21

if mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
