-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7f9a_273.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 1024000 then
  return mp.INFECTED
end
local l_0_1 = 0
if (hstrlog[1]).matched then
  l_0_1 = (hstrlog[1]).hitcount
end
if l_0_1 > 1 then
  return mp.INFECTED
end
return mp.CLEAN

