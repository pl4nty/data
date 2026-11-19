-- Threat: !InfrastructureShared
-- Name: e978d93e8d22
-- Type: 21

if mp.getfilesize() <= 700000 and mp.getfilesize() >= 600000 then
  return mp.INFECTED
end
return mp.CLEAN
