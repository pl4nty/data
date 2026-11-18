-- Threat: !InfrastructureShared
-- Name: 1537806612ffd
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 80000 and mp.getfilesize() < 83000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
