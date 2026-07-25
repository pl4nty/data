-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b340d3e0bd\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 or type(l_1_0) ~= "string" then
    return nil
  end
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_1 = (bm.get_imagepath)()
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = nil
do
  if this_sigattrlog then
    local l_0_3, l_0_4, l_0_5, l_0_6 = this_sigattrlog[3]
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 and l_0_3.matched and l_0_3.utf8p1 then
    l_0_2 = (MpCommon.PathToWin32Path)(l_0_3.utf8p1)
  end
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, "\\windows\\system32", 1, true) or (string.find)(l_0_2, "\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  if not l_0_0(l_0_1) then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if not l_0_0(l_0_2) then
    return mp.CLEAN
  end
  if l_0_8 ~= l_0_0(l_0_2) then
    return mp.CLEAN
  end
  local l_0_9, l_0_10, l_0_11 = , IsFileRecentlyDropped(l_0_2)
  do
    if l_0_10 and l_0_11 and true then
      local l_0_12 = nil
      if safeJsonDeserialize(R10_PC117) then
        R10_PC117 = (safeJsonDeserialize(R10_PC117)).UnsignedFile
        if R10_PC117 then
          R10_PC117 = mp
          R10_PC117 = R10_PC117.INFECTED
          return R10_PC117
        end
      end
    end
    return mp.CLEAN
  end
end

