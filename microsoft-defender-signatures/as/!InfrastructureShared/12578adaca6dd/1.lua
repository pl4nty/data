-- Threat: !InfrastructureShared
-- Name: 12578adaca6dd
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_hasexports") and mp.get_mpattribute("pea_no_tls") and mp.get_mpattribute("pea_locals_symbols_stripped") and mp.get_mpattribute("pea_line_numbers_stripped") and mp.getfilesize() >= 49152 and mp.getfilesize() < 73728 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
