-- Threat: !InfrastructureShared
-- Name: 9b8cb7eb35fb
-- Type: 21

if mp.getfilesize() <= 20480 then
  return mp.INFECTED
end
return mp.CLEAN
