-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\62ef_219.luac 

-- params : ...
-- function num : 0
local l_0_0 = (hstrlog[1]).hitcount
local l_0_1 = (hstrlog[2]).hitcount
if l_0_0 > 15 or l_0_1 > 15 or l_0_0 + l_0_1 > 15 then
  return mp.INFECTED
end
return mp.CLEAN

