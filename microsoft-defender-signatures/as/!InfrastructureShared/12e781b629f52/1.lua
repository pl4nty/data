-- Threat: !InfrastructureShared
-- Name: 12e781b629f52
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
