-- Threat: !InfrastructureShared
-- Name: d578a00b573a
-- Type: 21

if mp.getfilesize() <= 150000 then
  return mp.INFECTED
end
return mp.CLEAN
