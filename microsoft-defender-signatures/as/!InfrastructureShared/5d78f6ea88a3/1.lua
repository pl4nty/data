-- Threat: !InfrastructureShared
-- Name: 5d78f6ea88a3
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 3558077 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
