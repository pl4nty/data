-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3cb755f2e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched then
  local l_0_0, l_0_1 = nil, nil
  l_0_1 = (this_sigattrlog[2]).utf8p2
  local l_0_2 = nil
else
end
do
  -- DECOMPILER ERROR at PC31: Overwrote pending register: R0 in 'AssignReg'

  if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
    local l_0_3, l_0_4, l_0_5 = (this_sigattrlog[3]).utf8p1, (this_sigattrlog[3]).utf8p2
    l_0_5 = this_sigattrlog
    l_0_5 = l_0_5[4]
    l_0_4 = l_0_5.utf8p2
    local l_0_7, l_0_8, l_0_9 = nil
  else
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

      if isnull(l_0_3) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

      local l_0_10 = nil
      local l_0_6 = nil
      local l_0_11 = l_0_3
      -- DECOMPILER ERROR at PC63: Overwrote pending register: R3 in 'AssignReg'

      if not isnull(l_0_6) then
        local l_0_12 = ""
        local l_0_13 = (string.find)(l_0_10, "com.microsoft.runedge", 1, true)
        do
          if not (string.find)(l_0_12, "\\appdata\\", 1, true) and not (string.find)(l_0_12, "\\temp\\", 1, true) and not (string.find)(l_0_12, "\\programdata\\", 1, true) then
            local l_0_14, l_0_15, l_0_16, l_0_17 = (string.find)(l_0_10, "com.microsoft.", 1, true), (string.find)(l_0_12, "\\users\\public\\", 1, true)
          end
          -- DECOMPILER ERROR at PC114: Confused about usage of register: R5 in 'UnsetPending'

          -- DECOMPILER ERROR at PC116: Confused about usage of register: R6 in 'UnsetPending'

          if not l_0_13 and (not l_0_14 or not l_0_15) then
            return mp.CLEAN
          end
          if is_excluded_parent_proc_auto() then
            return mp.CLEAN
          end
          ;
          (bm.add_related_string)("NMH_KEY", l_0_11, bm.RelatedStringBMReport)
          if not isnull(l_0_6) then
            (bm.add_related_string)("NMH_MANIFEST", l_0_6, bm.RelatedStringBMReport)
            bm_AddRelatedFileFromCommandLine(((string.lower)(l_0_6)), nil, nil, 1)
          end
          local l_0_18 = nil
          if (bm.get_imagepath)() then
            (bm.add_related_file)((bm.get_imagepath)())
          end
          add_parents()
          TrackPidAndTechniqueBM("BM", "T1176.001", "AntinoNativeMessagingHost.AM")
          return mp.INFECTED
        end
      end
    end
  end
end

