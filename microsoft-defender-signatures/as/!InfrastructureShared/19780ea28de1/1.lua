-- Threat: !InfrastructureShared
-- Name: 19780ea28de1
-- Type: 21

if mp.getfilesize() < 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
