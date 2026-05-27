-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39d7676a43d2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "csc.exe", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_1, "/target:", 1, true) then
    local l_0_2 = (string.find)(l_0_1, "/t:", 1, true)
  end
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  do
    if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
      local l_0_4 = nil
      if (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\msbuild.exe", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\devenv.exe", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\dotnet.exe", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\servicehub", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\omnisharp", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\roslyn\\", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\jetbrains\\", 1, true) or (string.find)((string.lower)(((mp.GetParentProcInfo)()).image_path), "\\visual studio\\", 1, true) then
        return mp.CLEAN
      end
    end
    do
      if not (string.find)(l_0_1, "\\temp\\", 1, true) and not (string.find)(l_0_1, "\\tmp\\", 1, true) and not (string.find)(l_0_1, "\\downloads\\", 1, true) and not (string.find)(l_0_1, "\\desktop\\", 1, true) and not (string.find)(l_0_1, "\\appdata\\", 1, true) then
        local l_0_5 = nil
      end
      if not (string.find)(l_0_1, "\\users\\public\\", 1, true) then
        return mp.CLEAN
      end
      TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspCscCompileTarget")
      return mp.INFECTED
    end
  end
end

