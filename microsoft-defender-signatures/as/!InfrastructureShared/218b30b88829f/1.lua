-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\218b30b88829f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil and (this_sigattrlog[8]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[8]).utf8p2
else
  return mp.CLEAN
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil and (this_sigattrlog[7]).utf8p2 ~= "" then
  l_0_4 = (this_sigattrlog[7]).utf8p2
else
  return mp.CLEAN
end
if l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
if not (string.find)(l_0_3, "/private/tmp/update", 1, true) then
  return mp.CLEAN
end
do
  if (string.find)(l_0_4, "xattr -c", 1, true) or (string.find)(l_0_4, "xattr -d", 1, true) or (string.find)(l_0_4, "xattr -rc", 1, true) or (string.find)(l_0_4, "xattr -rd", 1, true) then
    local l_0_5 = l_0_3:match("([^/]+)$")
    if l_0_5 ~= "" and l_0_5 ~= nil and (string.find)(l_0_4, l_0_5, 1, true) then
      if (sysio.IsFileExists)(l_0_3) then
        (bm.add_threat_file)(l_0_3)
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

