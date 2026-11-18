-- Threat: !InfrastructureShared
-- Name: 3540584bfb4e
-- Type: 21

if string.match(string.sub(sigattr_head[1].p1, 2, 7), "%d+") then
  return mp.INFECTED
end
return mp.CLEAN
