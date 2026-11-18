-- Threat: !InfrastructureShared
-- Name: ddb34819a68a
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  l_0_1 = string.match(l_0_0, "\\appdata\\roaming\\([^\\]+)\\[^%.]+%.vbs")
  if l_0_1 == nil or string.len(l_0_1) ~= 6 then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) then
    mp.ReportLowfi(l_0_0, 1248478195)
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
local l_0_2, l_0_3
if this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].utf8p1
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_3 = string.match(l_0_2, "\\appdata\\roaming\\([^\\]+)\\[^%.]+%.ps1")
  if l_0_3 == nil or string.len(l_0_3) ~= 6 then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 3546485321)
    bm.add_related_file(l_0_2)
    return mp.INFECTED
  end
end
local l_0_4, l_0_5
if this_sigattrlog[3].matched then
  l_0_4 = this_sigattrlog[3].utf8p1
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  l_0_5 = string.match(l_0_4, "\\appdata\\roaming\\([^\\]+)\\[^%.]+%.ini")
  if l_0_5 == nil or string.len(l_0_5) ~= 6 then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_4) then
    mp.ReportLowfi(l_0_4, 2758025951)
    bm.add_related_file(l_0_4)
    return mp.INFECTED
  end
end
return mp.CLEAN
