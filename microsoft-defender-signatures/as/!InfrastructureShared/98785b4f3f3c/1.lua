-- Threat: !InfrastructureShared
-- Name: 98785b4f3f3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
