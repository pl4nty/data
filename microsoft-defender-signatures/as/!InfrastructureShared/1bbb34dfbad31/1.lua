-- Threat: !InfrastructureShared
-- Name: 1bbb34dfbad31
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  [".js"] = true,
  vbs = true,
  wsf = true,
  jse = true,
  vbe = true
}
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if 3 < string.len(l_0_4) and sysio.IsFileExists(l_0_4) then
    local l_0_5 = string.sub(l_0_4, -3)
    if l_0_1[l_0_5] then
      bm.add_related_file(l_0_4)
      mp.ReportLowfi(l_0_4, 2563622525)
    end
  end
end
return mp.INFECTED
