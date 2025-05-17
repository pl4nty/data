-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\467b317cd9887\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (MpCommon.QueryPersistContext)(l_0_0, "NewPECreatedNoCert")
if not l_0_1 then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == true then
  return mp.CLEAN
end
local l_0_2 = (sysio.GetFileLastWriteTime)(l_0_0)
if ((sysio.GetLastResult)()).Success and l_0_2 ~= 0 then
  l_0_2 = l_0_2 / 10000000 - 11644473600
  local l_0_3 = (MpCommon.GetCurrentTimeT)()
  if l_0_3 < l_0_2 or l_0_3 - (l_0_2) > 600 then
    return mp.CLEAN
  end
  triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/DllInject.SB")
  return mp.INFECTED
end
do
  return mp.CLEAN
end

