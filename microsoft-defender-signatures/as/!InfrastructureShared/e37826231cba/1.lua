-- Threat: !InfrastructureShared
-- Name: e37826231cba
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
