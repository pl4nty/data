-- Threat: !InfrastructureShared
-- Name: 69b37e102c80
-- Type: 21

local l_0_0
local l_0_1 = "|.js|jse|vbs|vbe|wsf|wsh"
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  if 1 < #l_0_2 then
    local l_0_3 = string.lower(l_0_2[2])
    local l_0_4 = string.sub(l_0_3, -3)
    if string.find(l_0_1, l_0_4, 1, true) then
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
        mp.ReportLowfi(l_0_3, 2419017217)
      end
    end
  end
end
return mp.INFECTED
