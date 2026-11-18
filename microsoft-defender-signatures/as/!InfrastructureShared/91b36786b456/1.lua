-- Threat: !InfrastructureShared
-- Name: 91b36786b456
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
else
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
if l_0_1 ~= nil then
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if sysio.IsFileExists(l_0_7) then
      bm.add_related_file(l_0_7)
    end
  end
end
return mp.INFECTED
