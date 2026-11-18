-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PlaMasq.B!dha
-- Type: 9
-- MpAttributes: !PEPCODE:HasDigitalSignature & (LUA:FileSizeLE20000.A | LUA:FileSizeLE40000.A)

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil then
  if l_0_1.CompanyName ~= "Adobe Systems Incorporated" then
    return mp.CLEAN
  end
  if l_0_1.FileOriginalName == "protect.exe" then
    return mp.CLEAN
  end
  if l_0_1.FileOriginalName == "WebInstaller.exe" then
    return mp.CLEAN
  end
  if l_0_1.ProductName == "Adobe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
