-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22ab3144e9184\0x00000689_luac 

-- params : ...
-- function num : 0
local l_0_0 = 5
local l_0_1 = 20
local l_0_2 = mp.SIGATTR_LOG_SZ
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = 0
local l_0_6 = {}
l_0_6[".txt"] = true
l_0_6[".html"] = true
l_0_6[".hta"] = true
for l_0_10 = l_0_2, 1, -1 do
  if (sigattr_tail[l_0_10]).attribute == 16384 and ((sigattr_tail[l_0_10]).utf8p1):byte(1) ~= 37 then
    local l_0_11 = ((sigattr_tail[l_0_10]).utf8p1):lower()
    local l_0_12 = l_0_11:match("[^\\]+$")
    if not isnull(l_0_12) then
      local l_0_13 = l_0_12:match("%.[^%.]+$")
      if not isnull(l_0_13) and l_0_6[l_0_13] == true then
        if l_0_3[l_0_12] ~= nil then
          (table.insert)(l_0_3[l_0_12], l_0_11)
        else
          local l_0_14 = {}
          -- DECOMPILER ERROR at PC63: No list found for R14 , SetList fails

        end
        do
          if l_0_0 <= #l_0_3[l_0_12] then
            local l_0_15 = {}
            -- DECOMPILER ERROR at PC70: Overwrote pending register: R15 in 'AssignReg'

            for l_0_19 = l_0_11, #l_0_3[l_0_12] do
              local l_0_20 = (sysio.GetFileSize)((l_0_3[l_0_12])[l_0_19])
              if l_0_20 < 400 or l_0_20 > 8000 then
                l_0_3[l_0_12] = nil
                break
              end
              if l_0_4[(l_0_3[l_0_12])[l_0_19]] ~= nil then
                break
              else
                l_0_4[(l_0_3[l_0_12])[l_0_19]] = true
              end
              if l_0_15[l_0_20] ~= nil then
                l_0_15[l_0_20] = l_0_15[l_0_20] + 1
              else
                l_0_15[l_0_20] = 1
              end
              if l_0_15[l_0_20] == #l_0_3[l_0_12] then
                local l_0_21 = (bm.get_current_process_startup_info)()
                local l_0_22 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
                local l_0_23 = ""
                if l_0_21 ~= nil then
                  l_0_23 = l_0_21.command_line
                else
                  l_0_21 = -1
                end
                local l_0_24 = {}
                l_0_24.cur_image_path = l_0_22
                l_0_24.cmd_line = l_0_23
                local l_0_25 = {}
                l_0_25.file_size = l_0_20
                l_0_25.file_paths = l_0_3[l_0_12]
                l_0_25.proc_meta_info = l_0_24
                local l_0_26 = safeJsonSerialize(l_0_25)
                ;
                (bm.add_related_string)("gen_ransom_note", l_0_26, bm.RelatedStringBMReport)
                sms_untrusted_process()
                return mp.INFECTED
              end
            end
          end
          do
            do
              l_0_5 = l_0_5 + 1
              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
if l_0_1 < l_0_5 then
  (bm.trigger_sig)("Exclude", "NoRansomDrop")
end
return mp.CLEAN

