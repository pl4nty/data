-- Threat: !InfrastructureShared
-- Name: 1f783c702d27
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 20480 then
  local l_0_1 = pe.get_versioninfo()
  if l_0_1 ~= nil and (l_0_1.OriginalFilename ~= nil and l_0_1.OriginalFilename:lower() == "monitor.exe" or l_0_1.InternalName ~= nil and l_0_1.InternalName:lower() == "monitor.exe" or l_0_1.CompanyName ~= nil and l_0_1.CompanyName:lower() == "monitor" or l_0_1.FileDescription ~= nil and l_0_1.FileDescription:lower() == "monitor" or l_0_1.LegalTrademarks ~= nil and l_0_1.LegalTrademarks:lower() == "monitor" or l_0_1.ProductName ~= nil and l_0_1.ProductName:lower() == "monitor") then
    return mp.INFECTED
  end
end
return mp.CLEAN
