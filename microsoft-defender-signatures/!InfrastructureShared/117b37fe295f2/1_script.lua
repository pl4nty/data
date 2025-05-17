-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\117b37fe295f2\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[6]).utf8p1 == "" or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[6]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[6]).utf8p1
local l_0_1 = (this_sigattrlog[6]).utf8p2
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
if not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p2 == nil or (this_sigattrlog[7]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_2 = (this_sigattrlog[7]).utf8p2
if SuspMacPathsToMonitor(l_0_2, true) then
  if l_0_0 == l_0_2 then
    if (sysio.IsFileExists)(l_0_2) then
      (bm.add_threat_file)(l_0_2)
    end
    return mp.INFECTED
  end
  local l_0_3 = l_0_2:match("[^/]*$")
  if l_0_3 ~= nil and (string.find)(l_0_1, l_0_3, 1, true) ~= nil then
    local l_0_4 = (string.lower)(l_0_0)
    if (string.find)(l_0_4, "/python", -7, true) ~= nil or (string.find)(l_0_4, "/python3", -8, true) ~= nil or (string.find)(l_0_4, "/sh", -3, true) ~= nil or (string.find)(l_0_4, "/zsh", -4, true) ~= nil or (string.find)(l_0_4, "/bash", -5, true) ~= nil then
      if (sysio.IsFileExists)(l_0_2) then
        (bm.add_threat_file)(l_0_2)
      end
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

