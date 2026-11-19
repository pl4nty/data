-- Threat: !InfrastructureShared
-- Name: 3c78c05e5440
-- Type: 21

if mp.get_mpattribute("SIGATTR:Backdoor:Win32/Delfdoorlib") then
  return mp.INFECTED
end
return mp.CLEAN
