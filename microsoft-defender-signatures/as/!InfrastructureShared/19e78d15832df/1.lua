-- Threat: !InfrastructureShared
-- Name: 19e78d15832df
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
