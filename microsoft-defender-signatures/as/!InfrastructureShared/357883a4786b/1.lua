-- Threat: !InfrastructureShared
-- Name: 357883a4786b
-- Type: 21

if pesecs[5].Name == ".rsrc" and pesecs[5].VirtualSize > 93955 and pesecs[5].VirtualSize < 93961 then
  return mp.INFECTED
end
return mp.CLEAN
