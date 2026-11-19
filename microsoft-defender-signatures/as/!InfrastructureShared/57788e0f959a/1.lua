-- Threat: !InfrastructureShared
-- Name: 57788e0f959a
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win32/ShellcodeRunner.AHB!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
