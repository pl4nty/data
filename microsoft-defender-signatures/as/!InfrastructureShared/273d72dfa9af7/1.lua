-- Threat: !InfrastructureShared
-- Name: 273d72dfa9af7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "python", 1, true) and IsProcNameInParentProcessTree("cmdhstr", "ai_exec_server.exe") then
  return mp.INFECTED
end
return mp.CLEAN
