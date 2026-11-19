-- Threat: !InfrastructureShared
-- Name: db7868bcc48b
-- Type: 21

if mp.getfilesize() <= 588888 and mp.getfilesize() >= 533000 then
  return mp.INFECTED
end
return mp.CLEAN
