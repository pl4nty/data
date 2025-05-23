-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f9b331051e53\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = 0
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = mp.SIGATTR_LOG_SZ
local l_0_5 = {}
local l_0_6 = (bm.get_imagepath)()
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = (string.lower)((MpCommon.PathToWin32Path)(l_0_6))
local l_0_8 = StringSplit(l_0_7, "\\")
if #l_0_8 > 7 and checkFileLastWriteTime(l_0_7, 120) == false then
  for l_0_12 = 1, l_0_4 do
    if (sigattr_tail[l_0_12]).attribute == 16384 and ((sigattr_tail[l_0_12]).utf8p1):byte(1) ~= 37 then
      local l_0_13 = ((sigattr_tail[l_0_12]).utf8p1):lower()
      local l_0_14 = l_0_13:match("%.[^%.]+$")
      if l_0_14 ~= nil then
        local l_0_15 = (mp.GetExtensionClass)(l_0_14)
        if l_0_15 ~= 4 then
          local l_0_16 = l_0_13:match("[^\\]+$")
          local l_0_17, l_0_18 = l_0_16:gsub("%.", ".")
          if l_0_15 == 0 and l_0_18 >= 2 and l_0_0[l_0_13] == nil then
            l_0_0[l_0_13] = l_0_12
            l_0_1 = l_0_1 + 1
          else
            if l_0_18 == 1 and l_0_2[l_0_13] == nil then
              l_0_2[l_0_13] = l_0_12
              l_0_3 = l_0_3 + 1
            end
          end
        end
      end
    end
  end
  local l_0_19 = {}
  l_0_19[".aes"] = true
  l_0_19[".amnesia"] = true
  l_0_19[".arena"] = true
  l_0_19[".artemy"] = true
  l_0_19[".bitkangoroo"] = true
  l_0_19[".bomber"] = true
  l_0_19[".bworm"] = true
  l_0_19[".cerber"] = true
  l_0_19[".chip"] = true
  l_0_19[".clop"] = true
  l_0_19[".code"] = true
  l_0_19[".crab"] = true
  l_0_19[".crazy"] = true
  l_0_19[".crrrt"] = true
  l_0_19[".cry"] = true
  l_0_19[".crypt12"] = true
  l_0_19[".crypt888"] = true
  l_0_19[".crypted"] = true
  l_0_19[".cryptolocker"] = true
  l_0_19[".dcrtr"] = true
  l_0_19[".defender"] = true
  l_0_19[".deria"] = true
  l_0_19[".diskdoctor"] = true
  l_0_19[".dmr64"] = true
  l_0_19[".dng"] = true
  l_0_19[".enc"] = true
  l_0_19[".encry"] = true
  l_0_19[".encrypted"] = true
  l_0_19[".exo"] = true
  l_0_19[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
  l_0_19[".flyper"] = true
  l_0_19[".frog"] = true
  l_0_19[".frs"] = true
  l_0_19[".ftcode"] = true
  l_0_19[".fun"] = true
  l_0_19[".garrantydecrypt"] = true
  l_0_19[".ghost"] = true
  l_0_19[".godra"] = true
  l_0_19[".gollum"] = true
  l_0_19[".hainhc"] = true
  l_0_19[".havoccrypt"] = true
  l_0_19[".hcked"] = true
  l_0_19[".hilda!"] = true
  l_0_19[".horros"] = true
  l_0_19[".ipygh"] = true
  l_0_19[".jaff"] = true
  l_0_19[".james"] = true
  l_0_19[".jkhnhu"] = true
  l_0_19[".jnec"] = true
  l_0_19[".josep"] = true
  l_0_19[".killrabbit"] = true
  l_0_19[".litra"] = true
  l_0_19[".locked"] = true
  l_0_19[".locked-"] = true
  l_0_19[".lockify"] = true
  l_0_19[".locky"] = true
  l_0_19[".losers"] = true
  l_0_19[".lotr"] = true
  l_0_19[".mailto[sevenoneone@cock.li].b6d27"] = true
  l_0_19[".mamo434376"] = true
  l_0_19[".matrix"] = true
  l_0_19[".nm4"] = true
  l_0_19[".nsmf"] = true
  l_0_19[".obfuscated"] = true
  l_0_19[".ohno!"] = true
  l_0_19[".oops"] = true
  l_0_19[".osiris"] = true
  l_0_19[".oxr"] = true
  l_0_19[".pewcrypt"] = true
  l_0_19[".phobos"] = true
  l_0_19[".protected"] = true
  l_0_19[".qtyu8vh5wdxf6oswam5nua==obck"] = true
  l_0_19[".ryk"] = true
  l_0_19[".sad"] = true
  l_0_19[".sage"] = true
  l_0_19[".salsa222"] = true
  l_0_19[".satan"] = true
  l_0_19[".saturn"] = true
  l_0_19[".satyr"] = true
  l_0_19[".se"] = true
  l_0_19[".shrug"] = true
  l_0_19[".shutupanddance"] = true
  l_0_19[".skystars"] = true
  l_0_19[".sysdown"] = true
  l_0_19[".thanatos"] = true
  l_0_19[".trevinomason1@mail.com.vsunit"] = true
  l_0_19[".tron"] = true
  l_0_19[".via"] = true
  l_0_19[".waffle"] = true
  l_0_19[".wamarlocked"] = true
  l_0_19[".whycry"] = true
  l_0_19[".wndie"] = true
  l_0_19[".wsmile"] = true
  l_0_19[".xcri"] = true
  l_0_19[".xf4g-vbrt-3v78"] = true
  l_0_19[".xort"] = true
  l_0_19[".yc5pdbhp"] = true
  l_0_19[".zorro"] = true
  l_0_19[".[cho.dambler@yandex.com]"] = true
  l_0_19[".[jackie7@asia.com]"] = true
  if l_0_1 >= 4 and l_0_3 >= 4 then
    for l_0_23,l_0_24 in pairs(l_0_0) do
      local l_0_25, l_0_26 = l_0_23:match("^(.+)%.(.+)$")
      l_0_26 = "." .. l_0_26
      if not isnull(l_0_25) and l_0_19[l_0_26] == true then
        local l_0_27 = l_0_2[l_0_25]
        if not isnull(l_0_27) then
          if l_0_5[l_0_26] ~= nil then
            (table.insert)(l_0_5[l_0_26], tostring(l_0_27) .. "||" .. tostring(l_0_24))
          else
            local l_0_28 = {}
            -- DECOMPILER ERROR at PC247: No list found for R18 , SetList fails

          end
          do
            if #l_0_5[l_0_26] >= 4 then
              local l_0_29 = {}
              local l_0_30 = {}
              local l_0_31 = (bm.get_imagepath)()
              if isnull(l_0_31) then
                l_0_31 = "NA"
              else
                l_0_31 = l_0_31:lower()
              end
              -- DECOMPILER ERROR at PC275: Overwrote pending register: R21 in 'AssignReg'

              if (bm.get_current_process_startup_info)() ~= nil then
                do
                  local l_0_32, l_0_43, l_0_44, l_0_45 = ((bm.get_current_process_startup_info)()).ppid
                  for l_0_36,l_0_37 in pairs(l_0_5[l_0_26]) do
                    local l_0_33 = nil
                    -- DECOMPILER ERROR at PC282: Confused about usage of register: R26 in 'UnsetPending'

                    for l_0_41,l_0_42 in ipairs(split(R26_PC282, "||")) do
                      -- DECOMPILER ERROR at PC292: Confused about usage of register: R31 in 'UnsetPending'

                      (table.insert)(l_0_30, (sigattr_tail[tonumber(R31_PC292)]).utf8p1)
                    end
                  end
                  l_0_29.file_list = l_0_30
                  l_0_29.cur_image_path = l_0_31
                  -- DECOMPILER ERROR at PC303: Confused about usage of register: R21 in 'UnsetPending'

                  l_0_29.proc_info = l_0_33
                  l_0_29.appended_ext = l_0_26
                  l_0_29.magic_mismatch = false
                  l_0_29.sig_count = (bm.get_sig_count)()
                  do
                    local l_0_46 = nil
                    ;
                    (bm.add_related_string)("gensbsim_ransom_meta", safeJsonSerialize(l_0_29), bm.RelatedStringBMReport)
                    reportGenericRansomware(safeJsonSerialize(l_0_29), true)
                    do return mp.INFECTED end
                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_STMT

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
l_0_19 = mp
l_0_19 = l_0_19.CLEAN
return l_0_19

