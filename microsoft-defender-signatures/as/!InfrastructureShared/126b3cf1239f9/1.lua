-- Threat: !InfrastructureShared
-- Name: 126b3cf1239f9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1)
  if this_sigattrlog[9].matched then
    mp.ReportLowfi(this_sigattrlog[9].utf8p1, 147270772)
  end
  if this_sigattrlog[10].matched then
    mp.ReportLowfi(this_sigattrlog[10].utf8p1, 982105579)
  end
  if this_sigattrlog[11].matched then
    mp.ReportLowfi(this_sigattrlog[11].utf8p1, 1815722029)
  end
  if this_sigattrlog[12].matched then
    mp.ReportLowfi(this_sigattrlog[12].utf8p1, 1078932623)
  end
  return mp.INFECTED
end
return mp.CLEAN
