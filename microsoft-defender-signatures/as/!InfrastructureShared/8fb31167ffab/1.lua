-- Threat: !InfrastructureShared
-- Name: 8fb31167ffab
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = "|.js|jse|vbs|vbe|wsf|wsh"
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p2
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) then
      local l_0_6 = string.lower(string.sub(l_0_5, -3))
      if string.find(l_0_2, l_0_6, 1, true) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
if l_0_1 ~= nil then
  local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if sysio.IsFileExists(l_0_9) then
      local l_0_10 = string.lower(string.sub(l_0_9, -3))
      if l_0_10 == "dll" then
        bm.add_related_file(l_0_9)
      end
    end
  end
end
return mp.INFECTED
