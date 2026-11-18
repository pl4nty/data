-- Threat: !InfrastructureShared
-- Name: 40298c316f69
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
