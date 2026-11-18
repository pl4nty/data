-- Threat: !InfrastructureShared
-- Name: 8f7855b294f9
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
mp.set_mpattribute("HSTR:Trojan:Win32/Colisi")
if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
return mp.CLEAN
