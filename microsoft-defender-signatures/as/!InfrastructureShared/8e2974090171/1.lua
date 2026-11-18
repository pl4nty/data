-- Threat: !InfrastructureShared
-- Name: 8e2974090171
-- Type: 21

if mp.getfilesize() > 1024000 and mp.getfilesize() < 3072000 then
  return mp.INFECTED
end
return mp.CLEAN
