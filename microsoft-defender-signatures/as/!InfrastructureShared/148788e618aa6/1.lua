-- Threat: !InfrastructureShared
-- Name: 148788e618aa6
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 16000000 and mp.getfilesize() < 18000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
