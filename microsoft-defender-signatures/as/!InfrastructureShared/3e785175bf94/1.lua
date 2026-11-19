-- Threat: !InfrastructureShared
-- Name: 3e785175bf94
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2 ~= nil and l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
