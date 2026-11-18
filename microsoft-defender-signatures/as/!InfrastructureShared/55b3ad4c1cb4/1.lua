-- Threat: !InfrastructureShared
-- Name: 55b3ad4c1cb4
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
local l_0_2 = string.lower(l_0_1)
if string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, ":\\windows\\system", 1, true) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_4 = {
    [".xls"] = true,
    xlsx = true,
    xlsb = true,
    xltx = true,
    xltm = true,
    xlam = true,
    [".xla"] = true,
    xlsm = true
  }
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if string.len(l_0_6) > 4 and sysio.IsFileExists(l_0_6) then
      local l_0_7 = string.sub(l_0_6, -4)
      if l_0_4[l_0_7] then
        bm.add_related_file(l_0_6)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
