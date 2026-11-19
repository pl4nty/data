-- Threat: !InfrastructureShared
-- Name: 4e784e4115b1
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 6000000 and mp.getfilesize() < 6300000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_3 = pe.get_versioninfo()
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3.OriginalFilename ~= "ladddad.exe" then
  return mp.CLEAN
end
return mp.INFECTED
