-- Threat: !InfrastructureShared
-- Name: 15a7806b4aba1
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.get_mpattribute("pea_relocs_stripped") and mp.get_mpattribute("pea_locals_symbols_stripped") and mp.get_mpattribute("pea_line_numbers_stripped") and mp.get_mpattribute("pea_no_uidata") and mp.getfilesize() >= 86016 and mp.getfilesize() < 151552 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
