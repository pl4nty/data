-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a586_687.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).timestamp == nil or (this_sigattrlog[3]).timestamp == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).ppid
local l_0_1 = (this_sigattrlog[2]).ppid
local l_0_2 = (this_sigattrlog[3]).ppid
if l_0_0 ~= l_0_1 or l_0_1 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[4]).ppid
local l_0_4 = false
local l_0_5, l_0_6 = (bm.get_process_relationships)(l_0_3)
for l_0_10,l_0_11 in ipairs(l_0_6) do
  if l_0_11.image_path ~= nil and (mp.bitand)(l_0_11.reason_ex, 1) == 1 and (string.find)((string.lower)(l_0_11.image_path), "\\curl.exe", 1, true) then
    l_0_4 = true
  end
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_12 = (this_sigattrlog[2]).timestamp
local l_0_13 = (this_sigattrlog[3]).timestamp
if l_0_13 < l_0_12 then
  return mp.CLEAN
end
if l_0_13 - l_0_12 > 6000000000 then
  return mp.CLEAN
end
return mp.INFECTED

