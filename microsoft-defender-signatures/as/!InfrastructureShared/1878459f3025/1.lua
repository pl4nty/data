-- Threat: !InfrastructureShared
-- Name: 1878459f3025
-- Type: 21

if mp.get_mpattribute("RPF:SmartAssembly") and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 ~= nil and string.find(string.lower(l_0_0.InternalName), "luckyleap", 1, true) then
    mp.set_mpattribute("Trojan:Win32/LuckyLeap")
  end
end
return mp.CLEAN
