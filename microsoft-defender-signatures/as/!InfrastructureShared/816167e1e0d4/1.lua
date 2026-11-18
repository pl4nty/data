-- Threat: !InfrastructureShared
-- Name: 816167e1e0d4
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 4 and mp.get_mpattribute("ATTRIBUTE:SIGA:MISL:PossibleKillProcess:S1") then
  local l_0_0 = mp.GetCertificateInfo(false)
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_3 = pe.get_versioninfo()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = {
    "KMSELDI.exe"
  }
  for l_0_5 = 1, #l_0_4 do
    if l_0_3.OriginalFilename == l_0_4[l_0_5] then
      return mp.INFECTED
    end
  end
end
return mp.LOWFI
