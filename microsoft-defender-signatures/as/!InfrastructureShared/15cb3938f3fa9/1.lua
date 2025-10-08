-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15cb3938f3fa9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = (bm.get_imagepath)()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4[".aes"] = true
l_0_4[".amnesia"] = true
l_0_4[".arena"] = true
l_0_4[".artemy"] = true
l_0_4[".avos"] = true
l_0_4[".bianlian"] = true
l_0_4[".bitkangoroo"] = true
l_0_4[".bomber"] = true
l_0_4[".bworm"] = true
l_0_4[".cerber"] = true
l_0_4[".chip"] = true
l_0_4[".clop"] = true
l_0_4[".code"] = true
l_0_4[".conti"] = true
l_0_4[".crab"] = true
l_0_4[".crazy"] = true
l_0_4[".crptd"] = true
l_0_4[".crrrt"] = true
l_0_4[".cry"] = true
l_0_4[".crypt12"] = true
l_0_4[".crypt888"] = true
l_0_4[".crypted"] = true
l_0_4[".cryptolocker"] = true
l_0_4[".darkbit"] = true
l_0_4[".dcrtr"] = true
l_0_4[".defender"] = true
l_0_4[".deria"] = true
l_0_4[".diskdoctor"] = true
l_0_4[".dmr64"] = true
l_0_4[".dng"] = true
l_0_4[".enc"] = true
l_0_4[".encry"] = true
l_0_4[".encrypted"] = true
l_0_4[".exo"] = true
l_0_4[".fargo"] = true
l_0_4[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
l_0_4[".flyper"] = true
l_0_4[".frog"] = true
l_0_4[".frs"] = true
l_0_4[".ftcode"] = true
l_0_4[".fun"] = true
l_0_4[".garrantydecrypt"] = true
l_0_4[".gdcb"] = true
l_0_4[".ghost"] = true
l_0_4[".godra"] = true
l_0_4[".gollum"] = true
l_0_4[".hainhc"] = true
l_0_4[".hcked"] = true
l_0_4[".herbst"] = true
l_0_4[".hilda!"] = true
l_0_4[".horros"] = true
l_0_4[".ipygh"] = true
l_0_4[".jaff"] = true
l_0_4[".james"] = true
l_0_4[".jkhnhu"] = true
l_0_4[".jnec"] = true
l_0_4[".josep"] = true
l_0_4[".killrabbit"] = true
l_0_4[".king_ouroboros"] = true
l_0_4[".litra"] = true
l_0_4[".lockbit"] = true
l_0_4[".locked"] = true
l_0_4[".locked-"] = true
l_0_4[".lockify"] = true
l_0_4[".locky"] = true
l_0_4[".losers"] = true
l_0_4[".lotr"] = true
l_0_4[".mamo434376"] = true
l_0_4[".matrix"] = true
l_0_4[".nm4"] = true
l_0_4[".nsmf"] = true
l_0_4[".obfuscated"] = true
l_0_4[".ohno!"] = true
l_0_4[".oops"] = true
l_0_4[".osiris"] = true
l_0_4[".oxr"] = true
l_0_4[".pewcrypt"] = true
l_0_4[".phobos"] = true
l_0_4[".protected"] = true
l_0_4[".qtyu8vh5wdxf6oswam5nua==obck"] = true
l_0_4[".ryk"] = true
l_0_4[".sad"] = true
l_0_4[".sage"] = true
l_0_4[".salsa222"] = true
l_0_4[".satan"] = true
l_0_4[".saturn"] = true
l_0_4[".satyr"] = true
l_0_4[".sb_locked"] = true
l_0_4[".se"] = true
l_0_4[".shrug"] = true
l_0_4[".shutupanddance"] = true
l_0_4[".skystars"] = true
l_0_4[".sykffle"] = true
l_0_4[".sysdown"] = true
l_0_4[".thanatos"] = true
l_0_4[".tron"] = true
l_0_4[".via"] = true
l_0_4[".waffle"] = true
l_0_4[".wamarlocked"] = true
l_0_4[".wasted"] = true
l_0_4[".whycry"] = true
l_0_4[".wndie"] = true
l_0_4[".wsmile"] = true
l_0_4[".xcri"] = true
l_0_4[".xf4g-vbrt-3v78"] = true
l_0_4[".xort"] = true
l_0_4[".yc5pdbhp"] = true
l_0_4[".zorro"] = true
local l_0_5 = {}
l_0_5[".[cho.dambler@yandex.com]"] = true
l_0_5[".[jackie7@asia.com]"] = true
l_0_5[".mailto[sevenoneone@cock.li].b6d27"] = true
l_0_5[".trevinomason1@mail.com.vsunit"] = true
for l_0_9 = 1, l_0_1 do
  if (sigattr_tail[l_0_9]).attribute == 16384 and ((sigattr_tail[l_0_9]).utf8p1):byte(1) ~= 37 then
    local l_0_10 = ((sigattr_tail[l_0_9]).utf8p1):lower()
    local l_0_11 = l_0_10:match("[^\\]+$")
    local l_0_12, l_0_13 = l_0_11:gsub("%.", ".")
    if l_0_13 >= 2 and l_0_0[l_0_10] == nil then
      l_0_0[l_0_10] = l_0_9
      local l_0_14, l_0_15 = l_0_11:match("^(.+)%.(.+)$")
      if not isnull(l_0_15) then
        l_0_15 = "." .. l_0_15
        local l_0_16 = false
        if l_0_4[l_0_15] == true then
          l_0_16 = true
        else
          for l_0_20,l_0_21 in pairs(l_0_5) do
            if (string.find)(l_0_11, l_0_20, 1, true) then
              l_0_15 = l_0_20
              l_0_16 = true
              break
            end
          end
        end
        do
          if l_0_16 then
            if type(l_0_2[l_0_15]) ~= "table" then
              l_0_2[l_0_15] = {}
            end
            ;
            (table.insert)(l_0_2[l_0_15], l_0_9)
            if #l_0_2[l_0_15] >= 3 then
              local l_0_22 = {}
              local l_0_23 = {}
              local l_0_24 = (bm.get_imagepath)()
              if isnull(l_0_24) then
                l_0_24 = "NA"
              else
                l_0_24 = l_0_24:lower()
              end
              -- DECOMPILER ERROR at PC236: Overwrote pending register: R20 in 'AssignReg'

              if (bm.get_current_process_startup_info)() ~= nil then
                do
                  local l_0_25, l_0_36, l_0_37, l_0_38 = ((bm.get_current_process_startup_info)()).ppid
                  for l_0_29,l_0_30 in pairs(l_0_2[l_0_15]) do
                    local l_0_26 = nil
                    -- DECOMPILER ERROR at PC243: Confused about usage of register: R25 in 'UnsetPending'

                    for l_0_34,l_0_35 in ipairs(split(1, "||")) do
                      -- DECOMPILER ERROR at PC253: Confused about usage of register: R30 in 'UnsetPending'

                      (table.insert)(l_0_23, (sigattr_tail[tonumber(R30_PC253)]).utf8p1)
                    end
                  end
                  l_0_22.file_list = l_0_23
                  l_0_22.cur_image_path = l_0_24
                  -- DECOMPILER ERROR at PC264: Confused about usage of register: R20 in 'UnsetPending'

                  l_0_22.proc_info = l_0_26
                  l_0_22.appended_ext = l_0_15
                  l_0_22.magic_mismatch = false
                  l_0_22.sig_count = (bm.get_sig_count)()
                  do
                    local l_0_39 = nil
                    ;
                    (bm.add_related_string)("gensbsim_ransom_meta", safeJsonSerialize(l_0_22), bm.RelatedStringBMReport)
                    do return mp.INFECTED end
                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC284: LeaveBlock: unexpected jumping out IF_STMT

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
return mp.CLEAN

