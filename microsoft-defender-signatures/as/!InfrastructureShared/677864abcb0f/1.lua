-- Threat: !InfrastructureShared
-- Name: 677864abcb0f
-- Type: 21

local l_0_0 = mp.getfilesize()
if 25000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1.CompanyName, "EPSON", 1, true) == nil then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "EpsonDeviceControl.dll" then
  return mp.CLEAN
end
return mp.INFECTED
