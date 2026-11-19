-- Threat: !InfrastructureShared
-- Name: 4c78de282f48
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1600000 and mp.getfilesize() < 2300000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 ~= nil and l_0_0.InternalName ~= "libGLESv2.dll" then
    local l_0_1 = mp.GetCertificateInfo()
    for l_0_2, l_0_3 in pairs(l_0_1) do
      if l_0_3.Signers ~= nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
