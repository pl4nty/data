-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b3557fd266\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 or type(l_1_0) ~= "string" then
    return nil
  end
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_1 = 3
if l_0_1 * 10000000 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = nil
do
  if this_sigattrlog then
    local l_0_4, l_0_5, l_0_6, l_0_7 = this_sigattrlog[3]
  end
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC45: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC50: Confused about usage of register: R4 in 'UnsetPending'

  if l_0_4 and l_0_4.matched and l_0_4.utf8p1 then
    l_0_3 = (MpCommon.PathToWin32Path)(l_0_4.utf8p1)
  end
  if not l_0_3 then
    return mp.CLEAN
  end
  l_0_3 = (string.lower)(l_0_3)
  if (mp.IsKnownFriendlyFile)(l_0_3, true, false) then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "\\windows\\system32", 1, true) or (string.find)(l_0_3, "\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if not l_0_0(l_0_2) then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if not l_0_0(l_0_3) then
    return mp.CLEAN
  end
  if l_0_9 ~= l_0_0(l_0_3) then
    return mp.CLEAN
  end
  local l_0_10, l_0_11, l_0_12 = , IsFileRecentlyDropped(l_0_3)
  do
    if l_0_11 and l_0_12 and true then
      local l_0_13 = nil
      if safeJsonDeserialize(R11_PC127) then
        R11_PC127 = (safeJsonDeserialize(R11_PC127)).UnsignedFile
        if R11_PC127 then
          R11_PC127 = mp
          R11_PC127 = R11_PC127.INFECTED
          return R11_PC127
        end
      end
    end
    return mp.CLEAN
  end
end

