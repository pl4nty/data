-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00007afc_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if peattributes.ismsil == true and l_0_0 > 458752 and l_0_0 < 589824 then
  return mp.INFECTED
end
return mp.LOWFI

