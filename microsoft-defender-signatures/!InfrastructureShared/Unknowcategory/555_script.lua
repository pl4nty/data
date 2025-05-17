-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\555_luac 

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
local l_0_3, l_0_4 = (string.match)(l_0_2, "^(.*\\)([^\\]+)$")
local l_0_5 = "\\windows\\system32\\"
if (string.sub)(l_0_3, -#l_0_5) ~= l_0_5 then
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
local l_0_7 = (sysio.GetPEVersionInfo)(l_0_2)
do
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R8 in 'UnsetPending'

  if (not l_0_7 or l_0_7.OriginalFilename ~= nil) and (string.lower)(l_0_7.OriginalFilename) == "netplwiz.exe" then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC89: freeLocal<0 in 'ReleaseLocals'

end

