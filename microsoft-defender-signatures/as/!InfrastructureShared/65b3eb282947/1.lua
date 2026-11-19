-- Threat: !InfrastructureShared
-- Name: 65b3eb282947
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  [".wsf"] = true
}
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.len(l_0_4) > 4 and sysio.IsFileExists(l_0_4) then
    local l_0_5 = string.sub(l_0_4, -4)
    if l_0_1[l_0_5] then
      bm.add_related_file(l_0_4)
      mp.ReportLowfi(l_0_4, 29661127)
    end
  end
end
return mp.INFECTED
