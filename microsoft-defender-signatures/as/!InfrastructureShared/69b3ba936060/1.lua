-- Threat: !InfrastructureShared
-- Name: 69b3ba936060
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 and sysio.IsFileExists(l_0_0) then
    mp.ReportLowfi(l_0_0, 1578871239)
  end
end
if this_sigattrlog[2].matched then
  local l_0_1 = this_sigattrlog[2].utf8p2
  if l_0_1 ~= nil and string.len(l_0_1) > 3 and sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 1851672550)
  end
end
if this_sigattrlog[3].matched then
  local l_0_2 = this_sigattrlog[3].utf8p2
  if l_0_2 ~= nil and string.len(l_0_2) > 3 and sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 2449707962)
  end
end
if this_sigattrlog[4].matched then
  local l_0_3 = this_sigattrlog[4].utf8p2
  if l_0_3 ~= nil and string.len(l_0_3) > 3 and sysio.IsFileExists(l_0_3) then
    mp.ReportLowfi(l_0_3, 195050746)
  end
end
if this_sigattrlog[5].matched then
  local l_0_4 = this_sigattrlog[5].utf8p2
  if l_0_4 ~= nil and string.len(l_0_4) > 3 and sysio.IsFileExists(l_0_4) then
    mp.ReportLowfi(l_0_4, 723996031)
  end
end
return mp.INFECTED
