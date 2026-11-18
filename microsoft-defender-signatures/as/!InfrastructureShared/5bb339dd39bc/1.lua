-- Threat: !InfrastructureShared
-- Name: 5bb339dd39bc
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if string.find(l_0_3, ":\\program files", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_3, "\\ccmcache\\", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_3, "ccm32bitlauncher", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
