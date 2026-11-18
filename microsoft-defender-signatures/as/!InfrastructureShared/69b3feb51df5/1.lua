-- Threat: !InfrastructureShared
-- Name: 69b3feb51df5
-- Type: 21

local l_0_0
local l_0_1 = "|.js|jse|vbs|vbe|"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      local l_0_5 = string.lower(string.sub(l_0_4, -3))
      if string.find(l_0_1, l_0_5, 1, true) then
        bm.add_related_file(l_0_4)
      end
    end
  end
end
return mp.INFECTED
