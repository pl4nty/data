-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__MalPackB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1 = 8265
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.BMSearchFile)(l_0_0 - l_0_1, l_0_1, "UPX!\144\000")
if l_0_2 and l_0_2 ~= -1 then
  return mp.CLEAN
end
return mp.INFECTED

