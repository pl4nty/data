-- Threat: !InfrastructureShared
-- Name: 69b351adffd3
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -32)):match("\\([^\\]+)$")
  local l_0_2 = {
    ["pcpitstopscheduleservice.exe"] = true
  }
  if l_0_2[l_0_1] then
    return mp.CLEAN
  end
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
end
return mp.INFECTED
