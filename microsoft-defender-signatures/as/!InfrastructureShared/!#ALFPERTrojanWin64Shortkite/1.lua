-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanWin64Shortkite\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 26214400 then
  return mp.CLEAN
end
if (pe.get_exports_count)() ~= 1 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (pe.get_exports)()
if l_0_2 == nil or l_0_1 ~= 1 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = (pe.mmap_string_rva)((l_0_2[1]).namerva, 64)
if l_0_3 ~= nil and (string.lower)(l_0_3) == "?fdread@@ya_kpeax@z" then
  return mp.INFECTED
end
return mp.CLEAN

