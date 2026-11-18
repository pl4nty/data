-- Threat: !InfrastructureShared
-- Name: 13cb3d4db3d3b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, Path, LuaFuncHelper

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = string.lower(normalize_path(this_sigattrlog[3].utf8p1))
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(normalize_path(this_sigattrlog[4].utf8p1))
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = string.lower(normalize_path(this_sigattrlog[6].utf8p1))
end
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if StringEndsWith(l_0_2, "\\basf service monitor.exe") or StringEndsWith(l_0_2, "\\basf welcome wizard.exe") or StringEndsWith(l_0_2, "\\pdqinventoryscanner.exe") or StringEndsWith(l_0_2, "\\dism.exe") or StringEndsWith(l_0_2, "\\mpam-d.exe") or StringEndsWith(l_0_2, "\\servicefabricextensionhandler.exe.exe") then
  return mp.CLEAN
end
if StringEndsWith(l_0_2, "\\powershell.exe") and IsProcNameInParentProcessTree("BM", "microsoft.management.services.intunewindowsagent.exe") then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil or l_0_3.ppid == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_3.ppid
local l_0_5 = mp.GetProcessCommandLine(l_0_4)
if l_0_5 ~= nil then
  l_0_5 = string.lower(l_0_5)
  if StringEndsWith(l_0_2, "\\microsoft.legion.hostrolebootstrapper.exe") then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_2, "\\powershell.exe") then
    if string.find(l_0_5, "\\windows\\ccm\\", 1, true) ~= nil or string.find(l_0_5, "\\microsoft intune management extension\\policies\\", 1, true) ~= nil then
      return mp.CLEAN
    end
    if StringEndsWith(l_0_0, "\\dismhost.ex") then
      return mp.CLEAN
    end
  end
  if StringEndsWith(l_0_2, "\\cscript.exe") and string.find(l_0_5, "\\fiddlercore\\installfiddlercore.wsf", 1, true) ~= nil then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_2, "\\rundll32.exe") and (string.find(l_0_5, "zzzzinvokemanagedcustomactionoutofproc", 1, true) ~= nil or string.find(l_0_5, ",dllweblogonentrypoint", 1, true) ~= nil) then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_2, "\\msiexec.exe") and string.find(l_0_5, ".msi", 1, true) == nil and string.find(l_0_5, "global\\msi0000", 1, true) ~= nil then
    return mp.CLEAN
  end
end
if StringEndsWith(l_0_2, "\\wmiprvse.exe") and (StringEndsWith(l_0_1, "\\appxprovider.dll") or StringEndsWith(l_0_1, "\\dismcore.dll") or StringEndsWith(l_0_1, "\\dismprov.dll") or StringEndsWith(l_0_1, "\\api-ms-win-core-processthreads-l1-1-1.dll") or StringEndsWith(l_0_1, ".mof") or StringEndsWith(l_0_1, "c:\\app\\monitoring\\")) then
  return mp.CLEAN
end

local function l_0_6(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_7 = l_0_6(string.lower(l_0_0))
if isnull(l_0_7) or #l_0_7 <= 3 then
  return mp.CLEAN
end
local l_0_8 = l_0_6(string.lower(l_0_1))
if isnull(l_0_8) or #l_0_8 <= 3 then
  return mp.CLEAN
end
if l_0_7 ~= l_0_8 then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_7) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, true) == true then
  return mp.CLEAN
end
local l_0_9 = "Posilod"
AppendToRollingQueueNamespaced(l_0_0, l_0_9, "CreatedByPPID", l_0_4)
AppendToRollingQueueNamespaced(l_0_1, l_0_9, "CreatedByPPID", l_0_4)
return mp.INFECTED
