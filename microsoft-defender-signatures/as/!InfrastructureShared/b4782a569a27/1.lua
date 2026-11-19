-- Threat: !InfrastructureShared
-- Name: b4782a569a27
-- Type: 21

if mp.getfilesize() < 47872 then
  return mp.INFECTED
end
return mp.CLEAN
