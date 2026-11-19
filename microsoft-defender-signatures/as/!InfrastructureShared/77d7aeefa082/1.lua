-- Threat: !InfrastructureShared
-- Name: 77d7aeefa082
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  l_0_1 = string.gsub(l_0_1, "%^", "")
  l_0_1 = string.gsub(l_0_1, ";", "")
  if string.find(l_0_1, " /c ", 1, true) and (string.find(l_0_1, " -ep", 1, true) or string.find(l_0_1, "bypass", 1, true)) and string.find(l_0_1, "&%s+call%s+set%s+%w+=%%%w+:~%d+") and (string.find(l_0_1, "&%s+set%s+%w+=%a*power") or string.find(l_0_1, "&%s+set%s+%w+=%a*shell")) then
    return mp.INFECTED
  end
end
return mp.CLEAN
