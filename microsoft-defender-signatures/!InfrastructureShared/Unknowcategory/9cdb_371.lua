-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9cdb_371.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if not peattributes.isdll or l_0_0 > 500000 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
if (hstrlog[1]).matched and (hstrlog[2]).matched then
  l_0_1 = (hstrlog[1]).hitcount
  l_0_2 = (hstrlog[2]).hitcount
end
if l_0_1 == 2 and l_0_2 == 2 then
  return mp.INFECTED
end
return mp.CLEAN

