-- Threat: !InfrastructureShared
-- Name: 6dd7ad092bc4
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
if not string.find(l_0_1, "ilasm", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 and l_0_2.image_path then
  local l_0_3 = string.lower(l_0_2.image_path)
  if string.find(l_0_3, "\\msbuild.exe", 1, true) or string.find(l_0_3, "\\devenv.exe", 1, true) or string.find(l_0_3, "\\dotnet.exe", 1, true) or string.find(l_0_3, "\\visual studio\\", 1, true) or string.find(l_0_3, "\\jetbrains\\", 1, true) or string.find(l_0_3, "\\rider\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_4 = false
if l_0_2 and l_0_2.image_path then
  local l_0_5 = string.lower(l_0_2.image_path)
  local l_0_6 = {
    "\\powershell.exe",
    "\\pwsh.exe",
    "\\cmd.exe",
    "\\wscript.exe",
    "\\cscript.exe",
    "\\mshta.exe",
    "\\python.exe",
    "\\python3.exe",
    "\\python"
  }
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if string.find(l_0_5, l_0_8, 1, true) then
      l_0_4 = true
      break
    end
  end
end
local l_0_9 = string.find(l_0_1, "\\temp\\", 1, true) or string.find(l_0_1, "\\tmp\\", 1, true) or string.find(l_0_1, "\\downloads\\", 1, true) or string.find(l_0_1, "\\appdata\\", 1, true) or string.find(l_0_1, "\\users\\public\\", 1, true) or string.find(l_0_1, "\\windows\\temp\\", 1, true)
if not l_0_4 and not l_0_9 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspIlasmCompileScriptHost")
return mp.INFECTED
