-- Threat: !InfrastructureShared
-- Name: 377809fa209c
-- Type: 21

local l_0_0 = pe.get_versioninfo()
local l_0_1 = mp.GetCertificateInfo()
if l_0_0.OriginalFilename ~= "Aziyir.exe" then
  return mp.CLEAN
end
if peattributes.ismsil == true then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
