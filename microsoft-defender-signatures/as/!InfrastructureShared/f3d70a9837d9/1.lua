-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f3d70a9837d9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and (string.find)(l_0_0.image_path, "/node", 1, true) then
  local l_0_1 = (mp.GetScannedPPID)()
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = (MpCommon.GetImagePathFromPid)(l_0_1)
  if (string.find)(l_0_2, "/sh", 1, true) or (string.find)(l_0_2, "/bash", 1, true) or (string.find)(l_0_2, "/dash", 1, true) or (string.find)(l_0_2, "/busybox", 1, true) then
    local l_0_3 = (string.lower)((mp.GetProcessCommandLine)(l_0_1))
    if isnull(l_0_3) then
      return mp.CLEAN
    end
    if (string.match)(l_0_3, "https?://") then
      if (string.find)(l_0_3, "chmod +x", 1, true) or (string.find)(l_0_3, "chmod 777", 1, true) then
        return mp.INFECTED
      end
      if (string.find)(l_0_3, "|sh", 1, true) or (string.find)(l_0_3, "| sh", 1, true) or (string.find)(l_0_3, "|bash", 1, true) or (string.find)(l_0_3, "| bash", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

