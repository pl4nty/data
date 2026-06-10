-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10fd704ccb74d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or #l_0_1 < 25 then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil or #l_0_2 < 25 then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3, l_0_4 = (string.match)(l_0_2, "^(.*)\\([^\\]+)$")
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%windir%") .. "\\system32")
if l_0_3 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = {}
l_0_6["utilman.exe"] = true
l_0_6["sethc.exe"] = true
l_0_6["osk.exe"] = true
l_0_6["magnify.exe"] = true
l_0_6["narrator.exe"] = true
l_0_6["displayswitch.exe"] = true
l_0_6["atbroker.exe"] = true
if l_0_6[l_0_4] == nil then
  return mp.CLEAN
end
if (MpCommon.IsFriendlyProcess)(l_0_0) then
  return mp.CLEAN
end
local l_0_7 = (sysio.GetPEVersionInfo)(l_0_2)
if (string.lower)(l_0_7 and l_0_7.OriginalFilename ~= nil or "") == l_0_4 then
  return mp.CLEAN
end
do
  if (string.lower)(l_0_7 and l_0_7.CompanyName ~= nil or "") == "microsoft corporation" then
    return mp.CLEAN
  end
  set_research_data("AccessibilityTool", l_0_4, false)
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R8 in 'UnsetPending'

  set_research_data("OriginalFileName", l_0_7 and l_0_7.OriginalFilename ~= nil or "", false)
  -- DECOMPILER ERROR at PC132: Confused about usage of register: R9 in 'UnsetPending'

  set_research_data("CompanyName", l_0_7 and l_0_7.CompanyName ~= nil or "", false)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC138: freeLocal<0 in 'ReleaseLocals'

end

