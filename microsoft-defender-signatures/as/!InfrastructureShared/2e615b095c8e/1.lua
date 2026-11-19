-- Threat: !InfrastructureShared
-- Name: 2e615b095c8e
-- Type: 21

if mp.get_mpattribute("SIGATTR:Adware:Win32/GameVance.A") then
  return mp.INFECTED
end
return mp.CLEAN
