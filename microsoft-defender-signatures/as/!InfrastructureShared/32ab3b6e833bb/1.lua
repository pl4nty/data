-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32ab3b6e833bb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
do
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil and (this_sigattrlog[8]).utf8p2 ~= "" then
    local l_0_3 = (this_sigattrlog[8]).utf8p2
    if l_0_3:find("/private/tmp/", 1, true) == 1 or l_0_3:find("/Users/Shared/", 1, true) == 1 or l_0_3:find("/tmp/", 1, true) == 1 or l_0_3:find("/Library/Caches/", 1, true) ~= nil or l_0_3:find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) == 1 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

