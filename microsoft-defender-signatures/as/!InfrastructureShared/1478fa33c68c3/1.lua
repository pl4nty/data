-- Threat: !InfrastructureShared
-- Name: 1478fa33c68c3
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
