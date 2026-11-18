-- Threat: !InfrastructureShared
-- Name: 39d7f32f072b
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
if not string.find(l_0_1, "vbc", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "/target:", 1, true) or string.find(l_0_1, "/t:", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 and l_0_3.image_path then
  local l_0_4 = string.lower(l_0_3.image_path)
  if string.find(l_0_4, "\\msbuild.exe", 1, true) or string.find(l_0_4, "\\devenv.exe", 1, true) or string.find(l_0_4, "\\dotnet.exe", 1, true) or string.find(l_0_4, "\\visual studio\\", 1, true) or string.find(l_0_4, "\\jetbrains\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = string.find(l_0_1, "\\temp\\", 1, true) or string.find(l_0_1, "\\tmp\\", 1, true) or string.find(l_0_1, "\\downloads\\", 1, true) or string.find(l_0_1, "\\desktop\\", 1, true) or string.find(l_0_1, "\\appdata\\", 1, true) or string.find(l_0_1, "\\users\\public\\", 1, true)
if not l_0_5 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspVbcCompileTarget")
return mp.INFECTED
