-- Threat: \xac!CauldronArtifactDLL.A
-- Type: 31

if not mp.get_mpattribute("HSTR:Trojan:Win32/CauldronArtifactDLL") then
  return mp.CLEAN
end
return mp.INFECTED
