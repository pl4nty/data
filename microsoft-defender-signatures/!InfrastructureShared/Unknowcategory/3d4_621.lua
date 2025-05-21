-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3d4_621.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if not l_0_1:find("\\cmd.exe") and not l_0_1:find("\\powershell.exe") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 ~= nil then
  local l_0_3 = (string.lower)(l_0_2.image_path)
  if l_0_3:find("\\java.exe") or l_0_3:find("\\javaw.exe") then
    local l_0_4 = (mp.GetProcessCommandLine)(l_0_2.ppid)
    if l_0_4 ~= nil then
      l_0_4 = (string.lower)(l_0_4)
      if l_0_4:find("\\activemq\\", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

