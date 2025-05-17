-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39d7e5d70537\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "psexesvc.exe", 1, true) then
  return mp.CLEAN
end
if IsKeyInRollingQueue("file_remote_dropped", l_0_2, true) then
  local l_0_3 = (mp.GetParentProcInfo)()
  if not l_0_3.image_path then
    do
      local l_0_4 = (string.lower)(isnull(l_0_3) or "")
      if l_0_4:match("([^\\]+)$") == "services.exe" then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

