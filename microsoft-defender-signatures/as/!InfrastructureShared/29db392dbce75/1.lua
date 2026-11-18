-- Threat: !InfrastructureShared
-- Name: 29db392dbce75
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p2
end
if l_0_0 ~= nil and 3 < string.len(l_0_0) then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      bm.add_related_file(l_0_3)
    end
  end
end
local l_0_4 = string.lower(bm.get_imagepath())
if string.find(l_0_4, "\\cscript.exe", 1, true) or string.find(l_0_4, "\\wscript.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
