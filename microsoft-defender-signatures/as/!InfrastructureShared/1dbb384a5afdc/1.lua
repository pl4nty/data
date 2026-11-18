-- Threat: !InfrastructureShared
-- Name: 1dbb384a5afdc
-- Type: 21

if mp.get_mpattribute("Behavior:Win32/SysCodeInjected.A") then
  return mp.CLEAN
end
return mp.INFECTED
