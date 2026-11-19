-- Threat: !InfrastructureShared
-- Name: 96b3ea9fbdb3
-- Type: 21

local l_0_0
if MpCommon.NidSearch(mp.NID_DISABLE_NW_REPORTING, 1) then
  return mp.CLEAN
end
if MpCommon.NidSearch(mp.NID_ENABLE_NW_REPORTING, 1) then
  if this_sigattrlog[1].matched then
    l_0_0 = this_sigattrlog[1].utf8p2
    if l_0_0 ~= nil then
      local l_0_1
      if string.match(l_0_0, "^\"%z[^\"]*\"%z") ~= nil then
        l_0_1 = string.gsub(string.match(l_0_0, "\"%z[^\"]*\"%z"), "\"%z", "")
      elseif string.match(l_0_0, "%.%ze%zx%ze%z") ~= nil then
        l_0_1 = string.match(l_0_0, "%.%ze%zx%ze%z")
      elseif string.match(string.lower(l_0_0), "%.%zd%zl%zl%z") ~= nil then
        l_0_1 = string.match(l_0_0, "%.%zd%zl%zl%z")
      end
      if l_0_1 ~= nil then
        mp.ReportLowfi(l_0_1, 734424339)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
