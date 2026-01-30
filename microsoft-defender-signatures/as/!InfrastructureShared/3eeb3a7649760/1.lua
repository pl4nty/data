-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3eeb3a7649760\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil and (this_sigattrlog[11]).utf8p1 ~= "" then
  local l_0_0 = nil
  local l_0_1 = (this_sigattrlog[11]).utf8p1
  local l_0_2 = (this_sigattrlog[8]).utf8p1
  local l_0_3 = (this_sigattrlog[8]).utf8p2
  if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil and (this_sigattrlog[9]).utf8p2 ~= "" then
    l_0_0 = (this_sigattrlog[9]).utf8p2
  else
    if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil and (this_sigattrlog[10]).utf8p2 ~= "" then
      l_0_0 = (this_sigattrlog[10]).utf8p2
    end
  end
  if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_2) then
    return mp.CLEAN
  end
  if l_0_3:find("/private/var/akitra/shield/upgrade", 1, true) or l_0_3:find("pmtechops.blob.core.windows.net/wiitfilerepository", 1, true) or l_0_3:find("/usr/local/jamf/bin/jamf", 1, true) then
    return mp.CLEAN
  end
  if not l_0_1:match("/%.[^/]+$") then
    return mp.CLEAN
  end
  local l_0_4 = l_0_1:match("[^/]*$")
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, l_0_4, 1, true) and SuspMacPathsToMonitor(l_0_1, true) then
    (bm.add_related_string)("process_cmdline", l_0_3, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

