-- Threat: !InfrastructureShared
-- Name: 5c7896f19486
-- Type: 21

if mp.getfilesize() > 202000 then
  return mp.INFECTED
end
return mp.CLEAN
