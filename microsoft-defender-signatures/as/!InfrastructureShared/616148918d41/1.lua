-- Threat: !InfrastructureShared
-- Name: 616148918d41
-- Type: 21

if mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
