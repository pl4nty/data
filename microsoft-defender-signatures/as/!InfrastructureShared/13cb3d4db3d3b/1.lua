-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13cb3d4db3d3b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or isnull((string.lower)(normalize_path((this_sigattrlog[4]).utf8p1))) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  -- DECOMPILER ERROR at PC66: Overwrote pending register: R1 in 'AssignReg'

  if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or isnull(nil) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if (bm.get_imagepath)() == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC101: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC113: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC119: Confused about usage of register: R2 in 'UnsetPending'

  if StringEndsWith((string.lower)((bm.get_imagepath)()), "\\basf service monitor.exe") or StringEndsWith((string.lower)((bm.get_imagepath)()), "\\basf welcome wizard.exe") or StringEndsWith((string.lower)((bm.get_imagepath)()), "\\pdqinventoryscanner.exe") or StringEndsWith((string.lower)((bm.get_imagepath)()), "\\dism.exe") or StringEndsWith((string.lower)((bm.get_imagepath)()), "\\mpam-d.exe") or StringEndsWith((string.lower)((bm.get_imagepath)()), "\\servicefabricextensionhandler.exe.exe") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC128: Confused about usage of register: R2 in 'UnsetPending'

  if StringEndsWith((string.lower)((bm.get_imagepath)()), "\\powershell.exe") and IsProcNameInParentProcessTree("BM", "microsoft.management.services.intunewindowsagent.exe") then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil then
    return mp.CLEAN
  end
  local l_0_6 = nil
  local l_0_7 = nil
  if (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid) ~= nil then
    if StringEndsWith(l_0_5, "\\microsoft.legion.hostrolebootstrapper.exe") then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC191: Confused about usage of register: R5 in 'UnsetPending'

    if StringEndsWith(l_0_5, "\\powershell.exe") then
      if (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), "\\windows\\ccm\\", 1, true) ~= nil or (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), "\\microsoft intune management extension\\policies\\", 1, true) ~= nil then
        return mp.CLEAN
      end
      if StringEndsWith(l_0_3, "\\dismhost.ex") then
        return mp.CLEAN
      end
    end
    -- DECOMPILER ERROR at PC218: Confused about usage of register: R5 in 'UnsetPending'

    if StringEndsWith(l_0_5, "\\cscript.exe") and (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), "\\fiddlercore\\installfiddlercore.wsf", 1, true) ~= nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC236: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC245: Confused about usage of register: R5 in 'UnsetPending'

    if StringEndsWith(l_0_5, "\\rundll32.exe") and ((string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), "zzzzinvokemanagedcustomactionoutofproc", 1, true) ~= nil or (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), ",dllweblogonentrypoint", 1, true) ~= nil) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC263: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC272: Confused about usage of register: R5 in 'UnsetPending'

    if StringEndsWith(l_0_5, "\\msiexec.exe") and (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), ".msi", 1, true) == nil and (string.find)((string.lower)((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)), "global\\msi0000", 1, true) ~= nil then
      return mp.CLEAN
    end
  end
  if StringEndsWith(l_0_5, "\\wmiprvse.exe") and (StringEndsWith(l_0_4, "\\appxprovider.dll") or StringEndsWith(l_0_4, "\\dismcore.dll") or StringEndsWith(l_0_4, "\\dismprov.dll") or StringEndsWith(l_0_4, "\\api-ms-win-core-processthreads-l1-1-1.dll") or StringEndsWith(l_0_4, ".mof") or StringEndsWith(l_0_4, "c:\\app\\monitoring\\")) then
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

  local l_0_8 = nil
  if isnull(getDirectoryPath((string.lower)(l_0_3))) or #getDirectoryPath((string.lower)(l_0_3)) <= 3 then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if isnull(getDirectoryPath((string.lower)(l_0_4))) or #getDirectoryPath((string.lower)(l_0_4)) <= 3 then
    return mp.CLEAN
  end
  if l_0_9 ~= getDirectoryPath((string.lower)(l_0_4)) then
    return mp.CLEAN
  end
  if isKnownCleanPathContext(l_0_9) then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_4, true, true) == true then
    return mp.CLEAN
  end
  local l_0_10 = nil
  AppendToRollingQueueNamespaced(l_0_3, "Posilod", "CreatedByPPID", l_0_7)
  -- DECOMPILER ERROR at PC396: Confused about usage of register: R8 in 'UnsetPending'

  AppendToRollingQueueNamespaced(l_0_4, "Posilod", "CreatedByPPID", l_0_7)
  return mp.INFECTED
end

