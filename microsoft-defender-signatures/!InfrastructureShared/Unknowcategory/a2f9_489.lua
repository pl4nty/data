-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2f9_489.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\endpoint agent\\edpa.exe", 1, true) or (string.find)(l_0_0, "\\program files (x86)\\internet explorer\\iexplore.exe", 1, true) or (string.find)(l_0_0, "mars\\microsoft azure recovery services agent\\bin\\cbengine.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

