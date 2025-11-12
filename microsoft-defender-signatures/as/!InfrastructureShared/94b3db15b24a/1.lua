-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\94b3db15b24a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched then
  local l_0_0 = nil
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {}
  local l_0_2, l_0_3 = pcall(mp.GetExecutablesFromCommandLine, l_0_0)
  if l_0_2 and l_0_3 then
    for l_0_7,l_0_8 in ipairs(l_0_3) do
      local l_0_9 = {}
      l_0_9.path = l_0_8
      l_0_8 = (mp.ContextualExpandEnvironmentVariables)(l_0_8)
      if l_0_8 then
        local l_0_10 = (mp.IsKnownFriendlyFile)(l_0_8, true, false)
        ;
        (bm.add_related_string)("FriendlyFile", l_0_8, bm.RelatedStringBMReport)
        if l_0_10 == nil or l_0_10 == false then
          local l_0_11 = 0
          local l_0_12 = 0
          local l_0_13 = (MpCommon.PathToWin32Path)(l_0_8)
          if l_0_13 and (string.match)(l_0_13, "^[%a]:\\") then
            l_0_11 = (sysio.GetFileSize)(l_0_13)
            l_0_9.size = l_0_11
            if (sysio.IsFileExists)(l_0_13) then
              local l_0_14 = (sysio.GetFileLastWriteTime)(l_0_13) / 10000000 - 11644473600
              local l_0_15 = (MpCommon.GetCurrentTimeT)()
              l_0_12 = l_0_15 - l_0_14
              l_0_9.age = l_0_12
              ;
              (table.insert)(l_0_1, l_0_9)
              ;
              (bm.add_related_file)(l_0_13)
            end
          end
        end
      end
    end
  end
  do
    do
      if next(l_0_1) then
        (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
      end
      return mp.INFECTED
    end
  end
end

