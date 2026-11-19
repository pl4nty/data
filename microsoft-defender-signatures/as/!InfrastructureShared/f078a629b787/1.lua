-- Threat: !InfrastructureShared
-- Name: f078a629b787
-- Type: 21

if mp.get_mpattribute("NID:Win64/Aotera.Pra1!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
