-- Threat: !InfrastructureShared
-- Name: !#Lua:ElectronOrNWJs
-- Type: 9

if peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isdamaged then
  return mp.CLEAN
end
if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 4 then
  return mp.CLEAN
end
local l_0_0 = -1
for l_0_1 = 3, pehdr.NumberOfSections do
  local l_0_2 = string.lower(pesecs[l_0_1].Name)
  if string.sub(l_0_2, 1, 8) == "cpadinfo" then
    l_0_0 = l_0_1
    break
  end
end
if l_0_0 == -1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = pe.mmap_rva(pesecs[l_0_0].VirtualAddress, 4)
local l_0_4 = mp.readu_u32(l_0_3, 1)
if l_0_4 ~= 1129341284 then
  return mp.CLEAN
end
local l_0_5 = pe.mmap_rva(pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA, 40)
local l_0_6 = mp.readu_u32(l_0_5, 13)
local l_0_7 = pe.mmap_rva(l_0_6, 32)
if string.sub(l_0_7, 1, 12) == "electron.exe" then
  mp.set_mpattribute("Lua:ElectronExe.A")
elseif string.sub(l_0_7, 1, 6) == "nw.exe" then
  mp.set_mpattribute("Lua:NWJsExe.A")
end
return mp.INFECTED
