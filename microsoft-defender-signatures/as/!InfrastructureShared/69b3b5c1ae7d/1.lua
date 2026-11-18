-- Threat: !InfrastructureShared
-- Name: 69b3b5c1ae7d
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
local l_0_1 = {}
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_3 = {
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
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if string.len(l_0_5) > 4 and sysio.IsFileExists(l_0_5) then
      local l_0_6 = string.sub(l_0_5, -4)
      if l_0_3[l_0_6] then
        bm.add_related_file(l_0_5)
        table.insert(l_0_1, l_0_5)
      end
    end
  end
end
MpCommon.SetPersistContextNoPath("OfficeWmiProc", l_0_1, 1)
return mp.INFECTED
