-- Threat: !InfrastructureShared
-- Name: 3478a55f8fa1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 7000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
