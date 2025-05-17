-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextEmbeddedPEFileA\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpNewlyCreatedHint") and not (mp.get_mpattribute)("MpInternal_IsPliScan") and not (mp.get_mpattribute)("MpIsSENSEScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Exception:EmbeddedPEFile.A") == true or (mp.get_mpattribute)("EmbeddedPE32GUIHdr") == true or (mp.get_mpattribute)("EmbeddedPE32PlusGUIHdr") == true or (mp.get_mpattribute)("CMN:HSTR:InstallerFile") == true then
  return mp.CLEAN
end
if pehdr == nil or pehdr.ImageBase == nil or pehdr.NumberOfSections == nil or pesecs == nil then
  return mp.CLEAN
end
local l_0_0 = (pesecs[1]).VirtualAddress + pehdr.ImageBase
local l_0_1 = pehdr.NumberOfSections
local l_0_2 = pehdr.ImageBase + (pesecs[l_0_1]).VirtualAddress + (pesecs[l_0_1]).VirtualSize
if l_0_0 == nil or l_0_0 <= pehdr.ImageBase or l_0_2 == nil or l_0_2 <= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = l_0_2 - l_0_0
if l_0_3 <= 5376 or l_0_3 >= 5242880 then
  return mp.CLEAN
end
local l_0_4 = "This program cannot be run in DOS mode.\144\002\255PE\144\000"
local l_0_5 = (pe.vm_search)(l_0_0, l_0_2, l_0_4, nil, pe.VM_SEARCH_BM)
if l_0_5 ~= 4294967295 then
  if peattributes.isdll then
    (mp.set_mpattribute)("Lua:Context/EmbeddedPEFile.A!dll")
  else
    ;
    (mp.set_mpattribute)("Lua:Context/EmbeddedPEFile.A!exe")
  end
  return mp.INFECTED
end
return mp.CLEAN

