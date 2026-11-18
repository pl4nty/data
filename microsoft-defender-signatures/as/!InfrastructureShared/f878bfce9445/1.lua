-- Threat: !InfrastructureShared
-- Name: f878bfce9445
-- Type: 21

if mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
