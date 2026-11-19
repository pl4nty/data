-- Threat: !InfrastructureShared
-- Name: 536154cc9045
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 == nil or l_0_0.InternalName == nil or l_0_0.ProductVersion == nil then
    return mp.LOWFI
  end
  if string.find(l_0_0.InternalName, "nano.exe", 1, true) and string.find(l_0_0.ProductVersion, "0.0.0.0", 1, true) then
    return mp.INFECTED
  end
end
return mp.LOWFI
