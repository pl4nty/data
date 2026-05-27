-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25d72a52c273\1.luac 

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
if not (string.find)(l_0_1, "vbc", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/out:", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/target:", 1, true) or (string.find)(l_0_1, "/t:", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, ".vb", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 and l_0_2.image_path then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if (string.find)(l_0_3, "\\msbuild.exe", 1, true) or (string.find)(l_0_3, "\\devenv.exe", 1, true) or (string.find)(l_0_3, "\\dotnet.exe", 1, true) or (string.find)(l_0_3, "\\visual studio\\", 1, true) or (string.find)(l_0_3, "\\jetbrains\\", 1, true) then
      return mp.CLEAN
    end
  end
  do
    if not (string.find)(l_0_1, "\\temp\\", 1, true) and not (string.find)(l_0_1, "\\tmp\\", 1, true) and not (string.find)(l_0_1, "\\downloads\\", 1, true) and not (string.find)(l_0_1, "\\desktop\\", 1, true) and not (string.find)(l_0_1, "\\appdata\\", 1, true) and not (string.find)(l_0_1, "\\users\\public\\", 1, true) then
      local l_0_4 = (string.find)(l_0_1, "\\windows\\temp\\", 1, true)
    end
    -- DECOMPILER ERROR at PC206: Confused about usage of register: R3 in 'UnsetPending'

    if not l_0_4 then
      return mp.CLEAN
    end
    TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspVbcCompileDefault")
    return mp.INFECTED
  end
end

