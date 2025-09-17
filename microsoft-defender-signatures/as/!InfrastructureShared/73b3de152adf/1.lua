-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3de152adf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "program files", 1, true) or (string.find)(l_0_0, "windows", 1, true) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
return mp.INFECTED

