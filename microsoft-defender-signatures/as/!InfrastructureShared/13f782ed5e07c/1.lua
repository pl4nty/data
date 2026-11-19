-- Threat: !InfrastructureShared
-- Name: 13f782ed5e07c
-- Type: 21

mp.set_mpattribute("HSTR:BrowserModifier:Win32/SpigotSearchProtection")
if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
return mp.CLEAN
