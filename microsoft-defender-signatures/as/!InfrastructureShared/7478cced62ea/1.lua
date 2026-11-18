-- Threat: !InfrastructureShared
-- Name: 7478cced62ea
-- Type: 21

if mp.getfilesize() < 58000 then
  return mp.INFECTED
end
return mp.CLEAN
