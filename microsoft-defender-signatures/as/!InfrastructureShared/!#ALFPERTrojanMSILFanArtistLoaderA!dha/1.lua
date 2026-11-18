-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:MSIL/FanArtistLoader.A!dha
-- Type: 10
-- MpAttributes: pea_has_msilresources & BM_UnsignedDll

if not mp.get_mpattribute("Lua:PeProductName!dete") then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 20 then
  return mp.CLEAN
end
return mp.INFECTED
