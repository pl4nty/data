-- Threat: !InfrastructureShared
-- Name: da783a1e5143
-- Type: 21

if mp.getfilesize() >= 227584 and mp.getfilesize() <= 235040 then
  return mp.INFECTED
end
return mp.CLEAN
