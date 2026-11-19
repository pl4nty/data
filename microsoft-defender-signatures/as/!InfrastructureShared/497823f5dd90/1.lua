-- Threat: !InfrastructureShared
-- Name: 497823f5dd90
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 150000 and mp.getfilesize() < 161000 and pe.get_exports_count() == 1 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
