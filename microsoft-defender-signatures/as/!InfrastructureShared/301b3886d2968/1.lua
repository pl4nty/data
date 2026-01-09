-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\301b3886d2968\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
do
  local l_0_2 = nil
  if l_0_0 then
    for l_0_6,l_0_7 in ipairs(l_0_0) do
      if l_0_7.ppid and l_0_7.image_path then
        local l_0_8 = (string.lower)(l_0_7.image_path)
        if ((string.find)(l_0_8, "onedrive.exe", 1, true) or (string.find)(l_0_8, "onedrivestandaloneupdater.exe", 1, true)) and (mp.bitand)(l_0_7.reason_ex, 1) == 1 then
          (bm.add_related_file)(l_0_8)
          if (mp.IsKnownFriendlyFile)(l_0_8, true, false) then
            (bm.add_related_string)("OFN", "OriginalOneDriveFile", bm.RelatedStringBMReport)
          else
            l_0_2 = (MpCommon.GetOriginalFileName)(l_0_8)
            do
              if not l_0_2 then
                local l_0_9 = (sysio.GetPEVersionInfo)(l_0_8)
                if l_0_9 and l_0_9.OriginalFilename then
                  l_0_2 = l_0_9.OriginalFilename
                end
              end
              if l_0_2 then
                (bm.add_related_string)("OFN", l_0_2, bm.RelatedStringBMReport)
                if not contains((string.lower)(l_0_2), "onedrive") then
                  (bm.trigger_sig)("OneDriveMasqueraded", l_0_2)
                end
              end
              local l_0_10 = {}
              local l_0_11 = add_parents()
              do
                local l_0_12 = add_parents_mp()
                l_0_10.parents_info = l_0_11
                l_0_10.parents_info_mp = l_0_12
                if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 then
                  l_0_10.BM_Parent_TimeStamp = (this_sigattrlog[13]).timestamp
                else
                  if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 then
                    l_0_10.BM_Parent_TimeStamp = (this_sigattrlog[14]).timestamp
                  end
                end
                ;
                (bm.add_related_string)("Debug_Info", safeJsonSerialize(l_0_10), bm.RelatedStringBMReport)
                for l_0_16,l_0_17 in ipairs(l_0_12) do
                  if l_0_17.ImagePath then
                    local l_0_18 = (string.lower)(l_0_17.ImagePath)
                    if contains(l_0_18, "onedrive") then
                      local l_0_19 = bm.trigger_sig
                      local l_0_20 = "SuspChild_Onedrive"
                      do
                        do
                          l_0_19(l_0_20, l_0_2 or "OriginalOneDriveFile")
                          do break end
                          -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
                    end
                  end
                end
                do return mp.INFECTED end
                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC185: freeLocal<0 in 'ReleaseLocals'

end

