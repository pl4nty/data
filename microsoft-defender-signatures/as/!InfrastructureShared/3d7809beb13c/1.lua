-- Threat: !InfrastructureShared
-- Name: 3d7809beb13c
-- Type: 21

if peattributes.no_security and mp.get_mpattribute("NID:Trojan:Win64/ShellCodeRunner.KK1!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
