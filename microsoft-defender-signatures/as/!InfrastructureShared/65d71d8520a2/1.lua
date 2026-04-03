-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\65d71d8520a2\1.luac 

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
do
  if not (string.find)(l_0_1, "--remote-debugging-port", 1, true) then
    local l_0_2, l_0_3 = (string.find)(l_0_1, "--inspect", 1, true)
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

  if isnull(l_0_2) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  for l_0_8,l_0_9 in ipairs({"\\code.exe", "\\code - insiders.exe", "\\cursor.exe", "\\windsurf.exe", "\\electron.exe", "\\electron-fiddle", "\\electron-forge", "\\fleet.exe", "\\brave.exe", "\\chrome.exe", "\\msedge.exe", "\\opera.exe", "\\vivaldi.exe", "\\chromium.exe"}) do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R8 in 'UnsetPending'

    if (string.find)(l_0_1, "\\electron.exe", 1, true) then
      return mp.CLEAN
    end
  end
  TrackPidAndTechniqueBM("CMDHSTR", "T1218.015", "ElectronDebugAbuse")
  return mp.INFECTED
end

