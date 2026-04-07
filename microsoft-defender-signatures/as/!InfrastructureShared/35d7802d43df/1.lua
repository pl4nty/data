-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35d7802d43df\1.luac 

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
if not (string.find)(l_0_1, "jsc", 1, true) or not (string.find)(l_0_1, "/out:", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 and l_0_2.image_path then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if (string.find)(l_0_3, "\\msbuild.exe", 1, true) or (string.find)(l_0_3, "\\devenv.exe", 1, true) or (string.find)(l_0_3, "\\dotnet.exe", 1, true) then
      return mp.CLEAN
    end
  end
  TrackPidAndTechniqueBM("CMDHSTR", "T1127.001", "SuspJscCompile")
  return mp.INFECTED
end

