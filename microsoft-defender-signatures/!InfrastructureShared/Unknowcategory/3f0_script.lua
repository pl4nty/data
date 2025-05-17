-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3f0_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.HSTR_WEIGHT
if l_0_0 ~= nil and (mp.bitand)(l_0_0, 15) >= 2 then
  return mp.INFECTED
end
return mp.CLEAN

