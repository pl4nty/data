-- Threat: !InfrastructureShared
-- Name: 61b350eefff9
-- Type: 21

if mp.get_mpattribute("Behavior:Win32/Dopplof.A") then
  return mp.INFECTED
end
return mp.CLEAN
