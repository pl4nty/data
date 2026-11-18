-- Threat: !InfrastructureShared
-- Name: 124b374851bab
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_0 ~= nil and (string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil) then
  if sysio.IsFileExists(l_0_0) then
    local l_0_1 = string.match(l_0_0, "(.*\\)[^\\]+$")
    if l_0_1 then
      bm.trigger_sig("TriggerShellPath", l_0_1)
    end
    mp.ReportLowfi(l_0_0, 3467544967)
    bm.add_related_file(l_0_0)
    bm.add_threat_file(l_0_0)
    local l_0_2, l_0_3 = pcall(reportBmInfo)
    if not l_0_2 and l_0_3 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
