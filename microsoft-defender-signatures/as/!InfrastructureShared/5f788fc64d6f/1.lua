-- Threat: !InfrastructureShared
-- Name: 5f788fc64d6f
-- Type: 21

if mp.getfilesize() > 102400 then
  return mp.CLEAN
end
return mp.INFECTED
