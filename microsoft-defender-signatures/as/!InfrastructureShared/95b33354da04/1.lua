-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95b33354da04\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  l_0_3 = (string.lower)((this_sigattrlog[1]).utf8p2)
else
  return mp.CLEAN
end
local l_0_4 = 0
local l_0_5 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).np2 ~= nil then
  l_0_5 = (this_sigattrlog[3]).utf8p1
  l_0_4 = (this_sigattrlog[3]).np2
end
local l_0_6 = l_0_5:match("([^/]+)$")
local l_0_7 = tonumber(tostring(l_0_4), 8)
local l_0_8, l_0_9, l_0_10 = (mp.bsplit)(l_0_7, 3)
if l_0_8 == 0 and l_0_9 == 0 and l_0_10 == 0 and R11_PC97 == 0 then
  return mp.CLEAN
end
if not (string.find)(l_0_3, (string.lower)(l_0_6), 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_3, "http", 1, true) and ((mp.bitand)(l_0_8, 1) == 1 or (mp.bitand)(l_0_9, 1) == 1 or (mp.bitand)(l_0_10, 1) == 1) then
  return mp.INFECTED
end
return mp.CLEAN

