-- Threat: !InfrastructureShared
-- Name: 2178f2c04582
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 20480 then
  local l_0_1 = pe.get_versioninfo()
  if l_0_1 ~= nil and (l_0_1.OriginalFilename ~= nil and l_0_1.OriginalFilename == "WindowsApp.exe" or l_0_1.InternalName ~= nil and l_0_1.InternalName == "WindowsApp.exe" or l_0_1.CompanyName ~= nil and l_0_1.CompanyName == "WindowsApp" or l_0_1.FileDescription ~= nil and l_0_1.FileDescription == "WindowsApp" or l_0_1.ProductName ~= nil and l_0_1.ProductName == "WindowsApp") then
    return mp.INFECTED
  end
end
return mp.CLEAN
