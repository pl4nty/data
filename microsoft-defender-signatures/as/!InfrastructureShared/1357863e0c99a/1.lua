-- Threat: !InfrastructureShared
-- Name: 1357863e0c99a
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("pea_epatscnstart") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_executes_from_last_section") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
