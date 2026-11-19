-- Threat: !InfrastructureShared
-- Name: 2d29a88da7ab
-- Type: 21

if mp.get_mpattribute("c") then
  return mp.INFECTED
end
return mp.CLEAN
