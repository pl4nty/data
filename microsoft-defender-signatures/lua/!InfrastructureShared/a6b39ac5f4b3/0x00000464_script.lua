-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a6b39ac5f4b3\0x00000464_luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[2]
if not l_0_0 or not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[3]
if not l_0_1 or not l_0_1.matched then
  return mp.CLEAN
end
if not ProcessCodeInjection(l_0_0, l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED

