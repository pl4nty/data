-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21fb3c867b16c\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_0 then
  for l_0_5,l_0_6 in ipairs(l_0_0) do
    if l_0_6.ppid and l_0_6.image_path then
      local l_0_7 = (string.lower)(l_0_6.image_path)
      if ((string.find)(l_0_7, "onedrive.exe", 1, true) or (string.find)(l_0_7, "onedrivestandaloneupdater.exe", 1, true)) and (mp.bitand)(l_0_6.reason_ex, 1) == 1 then
        (bm.add_related_file)(l_0_7)
        if (mp.IsKnownFriendlyFile)(l_0_7, true, false) then
          (bm.add_related_string)("OFN", "OriginalOneDriveFile", bm.RelatedStringBMReport)
        else
          local l_0_8 = (MpCommon.GetOriginalFileName)(l_0_7)
          do
            do
              do
                if not l_0_8 then
                  local l_0_9 = (sysio.GetPEVersionInfo)(l_0_7)
                  if l_0_9 and l_0_9.OriginalFilename then
                    l_0_8 = l_0_9.OriginalFilename
                  end
                end
                if l_0_8 then
                  (bm.add_related_string)("OFN", l_0_8, bm.RelatedStringBMReport)
                end
                do return mp.INFECTED end
                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

