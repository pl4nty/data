-- Threat: !InfrastructureShared
-- Name: 61d77219d993
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, ":\\Windows\\system32\\cscript.exe", 2, true) or string.find(l_0_1, ":\\program files\\rapid7\\insight agent\\components\\insight_agent\\.*\\ir_agent.exe", 2, false) or string.find(l_0_1, "\\windows defender advanced threat protection\\senseir.exe", 1, true) then
    return mp.CLEAN
  end
end
if IsProcNameInParentProcessTree("cmdhstr", "senseir.exe") or IsProcNameInParentProcessTree("cmdhstr", "syncro.service.runner.exe") then
  return mp.CLEAN
end
return mp.INFECTED
