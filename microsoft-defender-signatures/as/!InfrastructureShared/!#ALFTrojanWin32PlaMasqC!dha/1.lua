-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PlaMasq.C!dha
-- Type: 9
-- MpAttributes: !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "vmware-vmx.exe" then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil then
  if l_0_1.FileOriginalName == "VMware.SpbmApi.dll" then
    return mp.CLEAN
  end
  if l_0_1.FileOriginalName == "setup.exe" then
    return mp.CLEAN
  end
  if l_0_1.CompanyName ~= "VMware, Inc." then
    return mp.CLEAN
  end
  if l_0_1.ProductName == "VMware" then
    return mp.INFECTED
  end
end
return mp.CLEAN
