-- Threat: !InfrastructureShared
-- Name: !#TEL:Ransom:Win32/AvaddonCrypt.SP!MTB
-- Type: 8

if peattributes.hasappendeddata == false or peattributes.x86_image == false or peattributes.isexe == false or peattributes.no_security == true then
  return mp.CLEAN
end
if peattributes.isdriver == true then
  return mp.CLEAN
end
if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 1433600 or 1843200 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.FileVersion == nil then
  return mp.CLEAN
end
if l_0_1.FileDescription ~= "AVG Virus scanner" then
  return mp.CLEAN
end
if l_0_1.InternalName ~= "aswQuick.exe" then
  return mp.CLEAN
end
if l_0_1.LegalCopyright ~= "Copyright (C) 2014 AVG Technologies CZ, s.r.o." then
  return mp.CLEAN
end
return mp.INFECTED
