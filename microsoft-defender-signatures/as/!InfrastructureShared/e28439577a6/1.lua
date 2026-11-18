-- Threat: !InfrastructureShared
-- Name: e28439577a6
-- Type: 21

if mp.getfilesize() < 80000 then
  return mp.INFECTED
end
return mp.CLEAN
