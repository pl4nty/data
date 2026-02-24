-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c1d79d60c928\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "\\startup\\", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_1, ".vbs", 1, true) and not (string.find)(l_0_1, ".vbe", 1, true) and not (string.find)(l_0_1, ".js", 1, true) and not (string.find)(l_0_1, ".jse", 1, true) then
    local l_0_2 = (string.find)(l_0_1, ".wsf", 1, true)
  end
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if not ((mp.GetParentProcInfo)()).image_path then
    do
      local l_0_4 = nil
      if (string.find)((string.lower)((mp.GetParentProcInfo)() == nil or ""), "\\windows defender\\msmpeng.exe", 1, true) then
        return mp.CLEAN
      end
      TrackPidAndTechniqueBM("CMDHSTR", "T1059.005", "wscript_startup_exec")
      TrackPidAndTechniqueBM("CMDHSTR", "T1547.001", "startup_persistence_script")
      return mp.INFECTED
    end
  end
end

