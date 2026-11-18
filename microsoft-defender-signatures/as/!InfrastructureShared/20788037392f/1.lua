-- Threat: !InfrastructureShared
-- Name: 20788037392f
-- Type: 21

if mp.getfilesize() > 5242880 then
  return mp.CLEAN
end
return mp.INFECTED
