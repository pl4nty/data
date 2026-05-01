-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextFileHasIOAVUrlA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3 = extractUrlParts(l_0_0)
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1 then
  (mp.set_mpattribute)("Lua:Context/FileHasIOAVUrlDomain!" .. tostring(l_0_1))
end
if l_0_2 then
  (mp.set_mpattribute)("Lua:Context/FileHasIOAVUrlTld!" .. tostring(l_0_2))
end
if l_0_3 then
  (mp.set_mpattribute)("Lua:Context/FileHasIOAVUrlPort!" .. tostring(l_0_3))
end
return mp.CLEAN

