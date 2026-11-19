-- Threat: !InfrastructureShared
-- Name: 83d79e80e65b
-- Type: 21

if mp.get_mpattribute("SLF:Trojan:Win32/SuspObfusPipeCmd.EA") then
  return mp.INFECTED
end
return mp.CLEAN
