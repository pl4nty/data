-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanDropperWin64SplitLoaderInstallerA!dha\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["?getwindowinfos@@yajxz"] = true
l_0_0.generatekey = true
l_0_0.generatekeyw = true
l_0_0.memloadfunc = true
local l_0_1 = (mp.getfilesize)()
if l_0_1 > 1048576 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)()
local l_0_4 = 0
if l_0_2 ~= 4 then
  return mp.CLEAN
end
for l_0_8 = 1, l_0_2 do
  local l_0_9 = (pe.mmap_string_rva)((l_0_3[l_0_8]).namerva, 64)
  if l_0_9 ~= nil and l_0_0[(string.lower)(l_0_9)] then
    l_0_4 = l_0_4 + 1
  end
end
if l_0_4 == 4 then
  return mp.INFECTED
end
return mp.CLEAN

