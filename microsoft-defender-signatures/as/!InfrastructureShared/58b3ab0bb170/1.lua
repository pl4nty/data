-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b3ab0bb170\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p1
if not l_0_0 then
  return mp.CLEAN
end
if not (MpCommon.PathToWin32Path)(l_0_0) then
  l_0_0 = (string.lower)(l_0_0)
  if (string.find)(l_0_0, "\\windows\\system32\\", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\windows\\syswow64\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:match("^(.*)\\")
  local l_0_2 = (bm.get_imagepath)()
  if not l_0_2 then
    return mp.CLEAN
  end
  if not (MpCommon.PathToWin32Path)(l_0_2) then
    l_0_2 = (string.lower)(l_0_2)
    local l_0_3 = l_0_2:match("^(.*)\\")
    if not l_0_1 or not l_0_3 or l_0_3 ~= l_0_1 then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    do
      if not (sysio.GetPEVersionInfo)(l_0_2) then
        local l_0_4 = {}
      end
      -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

      local l_0_5 = nil
      if not l_0_4.OriginalFilename then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC111: Confused about usage of register: R5 in 'UnsetPending'

      if (string.lower)(l_0_4.OriginalFilename) ~= "applaunch.exe" then
        return mp.CLEAN
      end
      local l_0_6, l_0_7, l_0_8 = , IsFileRecentlyDropped(l_0_0)
      if not l_0_7 or not l_0_8 or not R8_PC126 then
        return mp.CLEAN
      end
      local l_0_9 = nil
      if safeJsonDeserialize(R10_PC133) then
        R10_PC133 = (safeJsonDeserialize(R10_PC133)).UnsignedFile
        if R10_PC133 then
          R10_PC133 = mp
          R10_PC133 = R10_PC133.INFECTED
          return R10_PC133
        end
      end
      R10_PC133 = mp
      R10_PC133 = R10_PC133.CLEAN
      return R10_PC133
    end
  end
end

