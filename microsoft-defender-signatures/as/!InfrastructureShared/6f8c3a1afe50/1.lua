-- Threat: !InfrastructureShared
-- Name: 6f8c3a1afe50
-- Type: 21

if mp.getfilesize() > 2097152 then
  return mp.CLEAN
end
return mp.INFECTED
