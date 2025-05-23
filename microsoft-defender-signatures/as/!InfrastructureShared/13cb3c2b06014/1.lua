-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13cb3c2b06014\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (MpCommon.QueryPersistContext)(l_0_1, "NewPECreatedNoCert")
if not l_0_2 then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_1, 600) ~= false then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_1, true, false) == true then
  return mp.CLEAN
end
do
  if (this_sigattrlog[7]).matched then
    local l_0_3, l_0_4, l_0_5 = (this_sigattrlog[7]).utf8p2
  end
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

  if not l_0_3 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

  l_0_0 = (string.match)(l_0_3, "Uri=([^;]+)")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R3 in 'UnsetPending'

  if not l_0_0 then
    l_0_0 = (string.match)(l_0_3, "DestIp=([^;]*);")
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_6 = nil
  if l_0_0:match("(%d+%.%d+%.%d+%.%d+)") and not isPublicIP(l_0_0:match("(%d+%.%d+%.%d+%.%d+)")) then
    return mp.CLEAN
  end
  if not l_0_0:find("%.") then
    return mp.CLEAN
  end
  local l_0_7, l_0_8 = , l_0_0:match("^([^:/?#]+)://(.+)$")
  if not l_0_8 then
    l_0_0 = "http://" .. l_0_0
  end
  local l_0_9 = nil
  local l_0_10, l_0_11 = {SIG_CONTEXT = "NONFRIENDLYIMAGE", CONTENT_SOURCE = "BM", TAG = "INTERFLOW", ProcName = l_0_1}, (mp.CheckUrl)(l_0_0)
  if l_0_11 == 1 and l_0_0 == 1 then
    return mp.CLEAN
  end
  local l_0_12 = nil
  local l_0_13 = SafeGetUrlReputation
  l_0_13 = l_0_13({l_0_0}, l_0_10, false, 2000)
  if (l_0_13.urls)[l_0_0] and ((l_0_13.urls)[l_0_0]).determination == 2 and ((l_0_13.urls)[l_0_0]).confidence >= 60 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

