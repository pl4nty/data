-- Threat: !InfrastructureShared
-- Name: 7978c12424eb
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 950000 and mp.getfilesize() < 1100000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_3 = pe.get_versioninfo()
  if l_0_3 ~= nil and l_0_3.OriginalFilename == "HH.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
