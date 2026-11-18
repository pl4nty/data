-- Threat: !InfrastructureShared
-- Name: 8a7858552ece
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_locals_symbols_stripped") and mp.get_mpattribute("pea_line_numbers_stripped") and mp.getfilesize() >= 1019904 and mp.getfilesize() < 1036288 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
