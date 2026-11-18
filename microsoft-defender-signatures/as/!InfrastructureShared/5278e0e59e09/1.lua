-- Threat: !InfrastructureShared
-- Name: 5278e0e59e09
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
