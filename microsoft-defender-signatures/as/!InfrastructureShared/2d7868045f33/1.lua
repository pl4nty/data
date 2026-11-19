-- Threat: !InfrastructureShared
-- Name: 2d7868045f33
-- Type: 21

if mp.getfilesize() < 157000 then
  return mp.INFECTED
end
return mp.CLEAN
