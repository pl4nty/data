-- Threat: !InfrastructureShared
-- Name: b678c7358e1e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 8000 then
  return mp.INFECTED
end
return mp.CLEAN
