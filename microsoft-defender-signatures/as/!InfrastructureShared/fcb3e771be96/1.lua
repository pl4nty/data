-- Threat: !InfrastructureShared
-- Name: fcb3e771be96
-- Type: 21

local l_0_0
local l_0_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) and string.find(l_0_1, string.sub(l_0_4, -4), 1, true) then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
