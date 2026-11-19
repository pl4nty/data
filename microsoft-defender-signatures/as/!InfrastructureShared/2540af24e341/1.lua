-- Threat: !InfrastructureShared
-- Name: 2540af24e341
-- Type: 21

if mp.get_mpattribute("SIGATTR:Win32/CompinjWindow") then
  return mp.INFECTED
end
return mp.LOWFI
