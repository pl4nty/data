-- Threat: !InfrastructureShared
-- Name: 4078988642c8
-- Type: 21

if pehdr.AddressOfEntryPoint == 5088 and pehdr.Machine == 34404 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
