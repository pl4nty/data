-- Threat: !InfrastructureShared
-- Name: 4578dd638dd1
-- Type: 21

if mp.getfilesize() < 32000 then
  return mp.INFECTED
end
return mp.CLEAN
