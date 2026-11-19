-- Threat: !InfrastructureShared
-- Name: 35b383102bc3
-- Type: 21

if mp.get_mpattribute("Behavior:Win32/Dopplof.A") then
  return mp.INFECTED
end
return mp.CLEAN
