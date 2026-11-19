-- Threat: !InfrastructureShared
-- Name: b4780ea879bb
-- Type: 21

if mp.getfilesize() < 500000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
