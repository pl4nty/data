-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\689_352.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[50]).matched == false or (this_sigattrlog[50]).timestamp == nil then
  return mp.CLEAN
end
if (this_sigattrlog[51]).matched == false or (this_sigattrlog[51]).timestamp == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[50]).timestamp
local l_0_1 = (this_sigattrlog[51]).timestamp
if l_0_1 < l_0_0 then
  return mp.CLEAN
end
if l_0_1 - l_0_0 < 600000000 then
  return mp.CLEAN
end
return mp.INFECTED

