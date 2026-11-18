-- Threat: !InfrastructureShared
-- Name: f378ef807632
-- Type: 21

mp.set_mpattribute("HSTR:Trojan:Win32/Tarcloin")
if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
