-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\18eb3350d1c32\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
do
  if (this_sigattrlog[7]).matched then
    local l_0_2, l_0_3, l_0_4 = (this_sigattrlog[7]).utf8p2
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  l_0_0 = (string.match)(l_0_2, "Uri=([^;]+)")
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_0 then
    l_0_0 = (string.match)(l_0_2, "DestIp=([^;]*);")
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if l_0_0:match("(%d+%.%d+%.%d+%.%d+)") and not isPublicIP(l_0_0:match("(%d+%.%d+%.%d+%.%d+)")) then
    return mp.CLEAN
  end
  if not l_0_0:find("%.") then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = , l_0_0:match("^([^:/?#]+)://(.+)$")
  if not l_0_7 then
    l_0_0 = "http://" .. l_0_0
  end
  local l_0_8 = nil
  local l_0_9, l_0_10 = {SIG_CONTEXT = "REVERSESHELL", CONTENT_SOURCE = "BM", TAG = "INTERFLOW", ProcName = l_0_1}, (mp.CheckUrl)(l_0_0)
  if l_0_10 == 1 and l_0_0 == 1 then
    return mp.CLEAN
  end
  local l_0_11 = nil
  local l_0_12 = SafeGetUrlReputation
  l_0_12 = l_0_12({l_0_0}, l_0_9, false, 2000)
  if not l_0_12 then
    return mp.CLEAN
  end
  if l_0_12 and (l_0_12.urls)[l_0_0] and ((l_0_12.urls)[l_0_0]).determination == 2 and ((l_0_12.urls)[l_0_0]).confidence >= 60 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

