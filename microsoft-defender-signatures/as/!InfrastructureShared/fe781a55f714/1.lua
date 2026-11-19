-- Threat: !InfrastructureShared
-- Name: fe781a55f714
-- Type: 21

if mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
