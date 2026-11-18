-- Threat: !InfrastructureShared
-- Name: !#ogimant_b_file_versions
-- Type: 8

if peattributes.isexe == false then
  return mp.CLEAN
end
if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
if peattributes.no_resources == true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 1048576 < l_0_0 then
  return mp.CLEAN
end
if pehdr.TimeDateStamp ~= 708992537 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.FileVersion == "5.1.2600.2180" and l_0_1.ProductName == "Windows\174 NetMeeting\174" then
  mp.set_mpattribute("//LUA:SoftwareBundler:Win32/Ogimant.gen!B_FileVersion")
end
if l_0_1.CompanyName == "Micr\208\190s\208\190ft C\208\190rp\208\190ration" then
  mp.set_mpattribute("//LUA:SoftwareBundler:Win32/Ogimant.gen!B_FileVersion")
end
return mp.CLEAN
