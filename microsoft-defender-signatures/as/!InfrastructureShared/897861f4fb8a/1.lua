-- Threat: !InfrastructureShared
-- Name: 897861f4fb8a
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 13 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:Trojan:Win32/Maener_Lowfi")
return mp.CLEAN
