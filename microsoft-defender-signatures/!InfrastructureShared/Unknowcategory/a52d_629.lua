-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a52d_629.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.match)(l_0_0, "([^\\]-[^\\%.]+)$")
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[3]).matched then
  l_0_1 = (this_sigattrlog[3]).utf8p2
end
if l_0_1 == nil and (string.len)(l_0_1) < 3 then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[4]).matched then
  l_0_2 = (this_sigattrlog[4]).utf8p1
  l_0_2 = (string.match)(l_0_2, "([^\\]-[^\\%.]+)$")
end
if l_0_2 == nil and (string.len)(l_0_2) < 3 then
  return mp.CLEAN
end
if l_0_0 == l_0_2 then
  return mp.CLEAN
end
if (string.find)(l_0_1, l_0_0, 1, true) and (string.find)(l_0_1, l_0_2, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

