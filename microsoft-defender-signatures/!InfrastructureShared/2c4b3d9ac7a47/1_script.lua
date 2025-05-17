-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c4b3d9ac7a47\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = (bm.get_imagepath)()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (string.lower)((MpCommon.PathToWin32Path)(l_0_3))
local l_0_5 = StringSplit(l_0_4, "\\")
if #l_0_5 >= 6 and checkFileLastWriteTime(l_0_4, 120) == false then
  local l_0_6 = {}
  l_0_6[".aes"] = true
  l_0_6[".amnesia"] = true
  l_0_6[".arena"] = true
  l_0_6[".artemy"] = true
  l_0_6[".avos"] = true
  l_0_6[".bianlian"] = true
  l_0_6[".bitkangoroo"] = true
  l_0_6[".bomber"] = true
  l_0_6[".bworm"] = true
  l_0_6[".cerber"] = true
  l_0_6[".chip"] = true
  l_0_6[".clop"] = true
  l_0_6[".code"] = true
  l_0_6[".conti"] = true
  l_0_6[".crab"] = true
  l_0_6[".crazy"] = true
  l_0_6[".crptd"] = true
  l_0_6[".crrrt"] = true
  l_0_6[".cry"] = true
  l_0_6[".crypt12"] = true
  l_0_6[".crypt888"] = true
  l_0_6[".crypted"] = true
  l_0_6[".cryptolocker"] = true
  l_0_6[".darkbit"] = true
  l_0_6[".dcrtr"] = true
  l_0_6[".defender"] = true
  l_0_6[".deria"] = true
  l_0_6[".diskdoctor"] = true
  l_0_6[".dmr64"] = true
  l_0_6[".dng"] = true
  l_0_6[".enc"] = true
  l_0_6[".encry"] = true
  l_0_6[".encrypted"] = true
  l_0_6[".exo"] = true
  l_0_6[".fargo"] = true
  l_0_6[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
  l_0_6[".flyper"] = true
  l_0_6[".frog"] = true
  l_0_6[".frs"] = true
  l_0_6[".ftcode"] = true
  l_0_6[".fun"] = true
  l_0_6[".garrantydecrypt"] = true
  l_0_6[".gdcb"] = true
  l_0_6[".ghost"] = true
  l_0_6[".godra"] = true
  l_0_6[".gollum"] = true
  l_0_6[".hainhc"] = true
  l_0_6[".hcked"] = true
  l_0_6[".herbst"] = true
  l_0_6[".hilda!"] = true
  l_0_6[".horros"] = true
  l_0_6[".ipygh"] = true
  l_0_6[".jaff"] = true
  l_0_6[".james"] = true
  l_0_6[".jkhnhu"] = true
  l_0_6[".jnec"] = true
  l_0_6[".josep"] = true
  l_0_6[".killrabbit"] = true
  l_0_6[".king_ouroboros"] = true
  l_0_6[".litra"] = true
  l_0_6[".lockbit"] = true
  l_0_6[".locked"] = true
  l_0_6[".locked-"] = true
  l_0_6[".lockify"] = true
  l_0_6[".locky"] = true
  l_0_6[".losers"] = true
  l_0_6[".lotr"] = true
  l_0_6[".mamo434376"] = true
  l_0_6[".matrix"] = true
  l_0_6[".nm4"] = true
  l_0_6[".nsmf"] = true
  l_0_6[".obfuscated"] = true
  l_0_6[".ohno!"] = true
  l_0_6[".oops"] = true
  l_0_6[".osiris"] = true
  l_0_6[".oxr"] = true
  l_0_6[".pewcrypt"] = true
  l_0_6[".phobos"] = true
  l_0_6[".protected"] = true
  l_0_6[".qtyu8vh5wdxf6oswam5nua==obck"] = true
  l_0_6[".ryk"] = true
  l_0_6[".sad"] = true
  l_0_6[".sage"] = true
  l_0_6[".salsa222"] = true
  l_0_6[".satan"] = true
  l_0_6[".saturn"] = true
  l_0_6[".satyr"] = true
  l_0_6[".sb_locked"] = true
  l_0_6[".se"] = true
  l_0_6[".shrug"] = true
  l_0_6[".shutupanddance"] = true
  l_0_6[".skystars"] = true
  l_0_6[".sykffle"] = true
  l_0_6[".sysdown"] = true
  l_0_6[".thanatos"] = true
  l_0_6[".tron"] = true
  l_0_6[".via"] = true
  l_0_6[".waffle"] = true
  l_0_6[".wamarlocked"] = true
  l_0_6[".wasted"] = true
  l_0_6[".whycry"] = true
  l_0_6[".wndie"] = true
  l_0_6[".wsmile"] = true
  l_0_6[".xcri"] = true
  l_0_6[".xf4g-vbrt-3v78"] = true
  l_0_6[".xort"] = true
  l_0_6[".yc5pdbhp"] = true
  l_0_6[".zorro"] = true
  local l_0_7 = {}
  l_0_7[".[cho.dambler@yandex.com]"] = true
  l_0_7[".[jackie7@asia.com]"] = true
  l_0_7[".mailto[sevenoneone@cock.li].b6d27"] = true
  l_0_7[".trevinomason1@mail.com.vsunit"] = true
  for l_0_11 = 1, l_0_1 do
    if (sigattr_tail[l_0_11]).attribute == 16384 and ((sigattr_tail[l_0_11]).utf8p1):byte(1) ~= 37 then
      local l_0_12 = ((sigattr_tail[l_0_11]).utf8p1):lower()
      local l_0_13 = l_0_12:match("[^\\]+$")
      local l_0_14, l_0_15 = l_0_13:gsub("%.", ".")
      if l_0_15 >= 2 and l_0_0[l_0_12] == nil then
        l_0_0[l_0_12] = l_0_11
        local l_0_16, l_0_17 = l_0_13:match("^(.+)%.(.+)$")
        if not isnull(l_0_17) then
          l_0_17 = "." .. l_0_17
          local l_0_18 = false
          if l_0_6[l_0_17] == true then
            l_0_18 = true
          else
            for l_0_22,l_0_23 in pairs(l_0_7) do
              if (string.find)(l_0_13, l_0_22, 1, true) then
                l_0_17 = l_0_22
                l_0_18 = true
                break
              end
            end
          end
          do
            if l_0_18 == true then
              if l_0_2[l_0_17] ~= nil then
                (table.insert)(l_0_2[l_0_17], l_0_11)
              else
                local l_0_24 = {}
                -- DECOMPILER ERROR at PC229: No list found for R19 , SetList fails

              end
              do
                if #l_0_2[l_0_17] >= 3 then
                  local l_0_25 = {}
                  local l_0_26 = {}
                  local l_0_27 = (bm.get_imagepath)()
                  if isnull(l_0_27) then
                    l_0_27 = "NA"
                  else
                    l_0_27 = l_0_27:lower()
                  end
                  -- DECOMPILER ERROR at PC257: Overwrote pending register: R22 in 'AssignReg'

                  if (bm.get_current_process_startup_info)() ~= nil then
                    do
                      local l_0_28, l_0_39, l_0_40, l_0_41 = ((bm.get_current_process_startup_info)()).ppid
                      for l_0_32,l_0_33 in pairs(l_0_2[l_0_17]) do
                        local l_0_29 = nil
                        -- DECOMPILER ERROR at PC264: Confused about usage of register: R27 in 'UnsetPending'

                        for l_0_37,l_0_38 in ipairs(split(1, "||")) do
                          -- DECOMPILER ERROR at PC274: Confused about usage of register: R32 in 'UnsetPending'

                          (table.insert)(l_0_26, (sigattr_tail[tonumber(R32_PC274)]).utf8p1)
                        end
                      end
                      l_0_25.file_list = l_0_26
                      l_0_25.cur_image_path = l_0_27
                      -- DECOMPILER ERROR at PC285: Confused about usage of register: R22 in 'UnsetPending'

                      l_0_25.proc_info = l_0_29
                      l_0_25.appended_ext = l_0_17
                      l_0_25.magic_mismatch = false
                      l_0_25.sig_count = (bm.get_sig_count)()
                      do
                        local l_0_42 = nil
                        ;
                        (bm.add_related_string)("gensbsim_ransom_meta", safeJsonSerialize(l_0_25), bm.RelatedStringBMReport)
                        reportGenericRansomware(safeJsonSerialize(l_0_25), true)
                        do return mp.INFECTED end
                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

