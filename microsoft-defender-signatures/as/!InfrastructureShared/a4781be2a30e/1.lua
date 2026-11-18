-- Threat: !InfrastructureShared
-- Name: a4781be2a30e
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  if l_0_0 ~= nil then
    for l_0_1, l_0_2 in ipairs(l_0_0) do
      if l_0_2.Signers ~= nil and l_0_2.Signers ~= "" then
        return mp.CLEAN
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
