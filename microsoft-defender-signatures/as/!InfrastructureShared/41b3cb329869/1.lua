-- Threat: !InfrastructureShared
-- Name: 41b3cb329869
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_2 = {
    [".xls"] = true,
    xlsx = true,
    xlsb = true,
    xltx = true,
    xltm = true,
    xlam = true,
    [".xla"] = true,
    xlsm = true
  }
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if string.len(l_0_4) > 4 and sysio.IsFileExists(l_0_4) then
      local l_0_5 = string.sub(l_0_4, -4)
      if l_0_2[l_0_5] then
        bm.add_related_file(l_0_4)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
