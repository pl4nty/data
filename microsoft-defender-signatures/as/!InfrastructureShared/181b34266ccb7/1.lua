-- Threat: !InfrastructureShared
-- Name: 181b34266ccb7
-- Type: 21

local l_0_0
local l_0_1 = "|.js|jse|wsf|vbs|vbe|xls|doc|ppt|pps|"
local l_0_2 = "|docx|pptx|ppsx|xlsx|rtf|"
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
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) then
      local l_0_6 = string.lower(string.sub(l_0_5, -4))
      local l_0_7 = string.sub(l_0_6, -3)
      if string.find(l_0_2, l_0_6, 1, true) or string.find(l_0_1, l_0_7, 1, true) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
return mp.INFECTED
