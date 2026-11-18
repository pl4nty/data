-- Threat: !InfrastructureShared
-- Name: 63d70085050d
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, ":\\Windows\\system32\\cscript.exe", 2, true) or string.find(l_0_1, ":\\program files\\rapid7\\insight agent\\components\\insight_agent\\.*\\ir_agent.exe", 2, false) then
    return mp.CLEAN
  end
end
return mp.INFECTED
