-- Threat: !InfrastructureShared
-- Name: 69b3f1ed5a74
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_2 = {
    [".xls"] = true,
    [".doc"] = true,
    [".ppt"] = true,
    [".pps"] = true,
    docx = true,
    pptx = true,
    ppsx = true,
    xlsx = true,
    [".rtf"] = true,
    [".xml"] = true,
    dotx = true,
    dotm = true,
    [".odt"] = true,
    xlsb = true,
    xltx = true,
    xltm = true,
    xlam = true,
    [".xla"] = true,
    docm = true,
    xlsm = true,
    pptm = true
  }
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if string.len(l_0_4) > 4 and sysio.IsFileExists(l_0_4) then
      local l_0_5 = string.sub(l_0_4, -4)
      if l_0_2[l_0_5] then
        bm.add_related_file(l_0_4)
      end
    end
  end
end
return mp.INFECTED
