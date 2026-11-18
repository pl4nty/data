-- Threat: !InfrastructureShared
-- Name: 41787f4e6183
-- Type: 21

if mp.getfilesize() > 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
