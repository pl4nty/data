-- Threat: !InfrastructureShared
-- Name: b978f0c2faf4
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil and mp.get_mpattribute("HSTR:ollama!MTB") then
    return mp.INFECTED
  end
end
return mp.CLEAN
