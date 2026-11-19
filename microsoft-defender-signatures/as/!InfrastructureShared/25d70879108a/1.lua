-- Threat: !InfrastructureShared
-- Name: 25d70879108a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "csc.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "/out:", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "/target:", 1, true) or string.find(l_0_1, "/t:", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, ".cs", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 and l_0_2.image_path then
  local l_0_3 = string.lower(l_0_2.image_path)
  if string.find(l_0_3, "\\msbuild.exe", 1, true) or string.find(l_0_3, "\\devenv.exe", 1, true) or string.find(l_0_3, "\\dotnet.exe", 1, true) or string.find(l_0_3, "\\servicehub", 1, true) or string.find(l_0_3, "\\omnisharp", 1, true) or string.find(l_0_3, "\\roslyn\\", 1, true) or string.find(l_0_3, "\\jetbrains\\", 1, true) or string.find(l_0_3, "\\visual studio\\", 1, true) then
    return mp.CLEAN
  end
end
if string.find(l_0_1, "/noconfig", 1, true) and string.find(l_0_1, "/fullpaths", 1, true) then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_1, "\\temp\\", 1, true) or string.find(l_0_1, "\\tmp\\", 1, true) or string.find(l_0_1, "\\downloads\\", 1, true) or string.find(l_0_1, "\\desktop\\", 1, true) or string.find(l_0_1, "\\appdata\\", 1, true) or string.find(l_0_1, "\\users\\public\\", 1, true) or string.find(l_0_1, "\\windows\\temp\\", 1, true)
if not l_0_4 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspCscCompileDefault")
return mp.INFECTED
