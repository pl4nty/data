-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1b8b3812628fc\1.luac 

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
local l_0_3 = 0
local l_0_4 = nil
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil and (this_sigattrlog[6]).np2 ~= nil then
  l_0_4 = (this_sigattrlog[6]).utf8p1
  l_0_3 = (this_sigattrlog[6]).np2
end
local l_0_5 = tonumber(tostring(l_0_3), 8)
local l_0_6, l_0_7, l_0_8 = (mp.bsplit)(l_0_5, 3)
if l_0_6 == 0 and l_0_7 == 0 and l_0_8 == 0 and R9_PC67 == 0 then
  return mp.CLEAN
end
if l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
if (mp.bitand)(l_0_6, 1) == 1 or (mp.bitand)(l_0_7, 1) == 1 or (mp.bitand)(l_0_8, 1) == 1 then
  return mp.INFECTED
end
return mp.CLEAN

