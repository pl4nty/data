-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13cb3d4db3d3b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if StringEndsWith(l_0_0, "\\powershell.exe") and IsProcNameInParentProcessTree("BM", "microsoft.management.services.intunewindowsagent.exe") then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.ppid
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if l_0_3 ~= nil then
  l_0_3 = (string.lower)(l_0_3)
  if StringEndsWith(l_0_0, "\\microsoft.legion.hostrolebootstrapper.exe") then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_0, "\\powershell.exe") and ((string.find)(l_0_3, "\\windows\\ccm\\", 1, true) ~= nil or (string.find)(l_0_3, "\\microsoft intune management extension\\policies\\", 1, true) ~= nil) then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_0, "\\cscript.exe") and (string.find)(l_0_3, "\\fiddlercore\\installfiddlercore.wsf", 1, true) ~= nil then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_0, "\\rundll32.exe") and ((string.find)(l_0_3, "zzzzinvokemanagedcustomactionoutofproc", 1, true) ~= nil or (string.find)(l_0_3, ",dllweblogonentrypoint", 1, true) ~= nil) then
    return mp.CLEAN
  end
end
local l_0_4 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_4 = (string.lower)(normalize_path((this_sigattrlog[3]).utf8p1))
else
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
    l_0_4 = (string.lower)(normalize_path((this_sigattrlog[4]).utf8p1))
  end
end
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = nil
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
  l_0_5 = (string.lower)(normalize_path((this_sigattrlog[6]).utf8p1))
end
if isnull(l_0_5) then
  return mp.CLEAN
end
getDirectoryPath = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:match, l_1_0
  do
    local l_1_3 = "^(.*)[/\\][^/\\]+$"
    do return l_1_1(l_1_2, l_1_3) end
    -- DECOMPILER ERROR at PC4: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_6 = getDirectoryPath((string.lower)(l_0_4))
if isnull(l_0_6) or #l_0_6 <= 3 then
  return mp.CLEAN
end
local l_0_7 = getDirectoryPath((string.lower)(l_0_5))
if isnull(l_0_7) or #l_0_7 <= 3 then
  return mp.CLEAN
end
if l_0_6 ~= l_0_7 then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_6) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_5, true, true) == true then
  return mp.CLEAN
end
local l_0_8 = "Posilod"
AppendToRollingQueueNamespaced(l_0_4, l_0_8, "CreatedByPPID", l_0_2)
AppendToRollingQueueNamespaced(l_0_5, l_0_8, "CreatedByPPID", l_0_2)
return mp.INFECTED

