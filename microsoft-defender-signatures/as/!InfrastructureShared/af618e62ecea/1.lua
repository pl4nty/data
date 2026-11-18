-- Threat: !InfrastructureShared
-- Name: af618e62ecea
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.hasappendeddata then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 == nil or l_0_0 and l_0_0.CompanyName ~= "www.xmrig.com" and l_0_0.OriginalFilename ~= "xmrig.exe" and l_0_0.OriginalFilename ~= "xmrigMiner.exe" then
    mp.set_mpattribute("Miner:XMRigRelated")
    return mp.INFECTED
  end
end
return mp.CLEAN
