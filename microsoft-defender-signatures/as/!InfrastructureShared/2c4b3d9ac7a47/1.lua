-- Threat: !InfrastructureShared
-- Name: 2c4b3d9ac7a47
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = bm.get_imagepath()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3))
local l_0_5 = StringSplit(l_0_4, "\\")
if 6 <= #l_0_5 and checkFileLastWriteTime(l_0_4, 120) == false then
  local l_0_6 = {
    [".aes"] = true,
    [".amnesia"] = true,
    [".arena"] = true,
    [".artemy"] = true,
    [".avos"] = true,
    [".bianlian"] = true,
    [".bitkangoroo"] = true,
    [".bomber"] = true,
    [".bworm"] = true,
    [".cerber"] = true,
    [".chip"] = true,
    [".clop"] = true,
    [".code"] = true,
    [".conti"] = true,
    [".crab"] = true,
    [".crazy"] = true,
    [".crptd"] = true,
    [".crrrt"] = true,
    [".cry"] = true,
    [".crypt12"] = true,
    [".crypt888"] = true,
    [".crypted"] = true,
    [".cryptolocker"] = true,
    [".darkbit"] = true,
    [".dcrtr"] = true,
    [".defender"] = true,
    [".deria"] = true,
    [".diskdoctor"] = true,
    [".dmr64"] = true,
    [".dng"] = true,
    [".enc"] = true,
    [".encry"] = true,
    [".encrypted"] = true,
    [".exo"] = true,
    [".fargo"] = true,
    [".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true,
    [".flyper"] = true,
    [".frog"] = true,
    [".frs"] = true,
    [".ftcode"] = true,
    [".fun"] = true,
    [".garrantydecrypt"] = true,
    [".gdcb"] = true,
    [".ghost"] = true,
    [".godra"] = true,
    [".gollum"] = true,
    [".hainhc"] = true,
    [".hcked"] = true,
    [".herbst"] = true,
    [".hilda!"] = true,
    [".horros"] = true,
    [".ipygh"] = true,
    [".jaff"] = true,
    [".james"] = true,
    [".jkhnhu"] = true,
    [".jnec"] = true,
    [".josep"] = true,
    [".killrabbit"] = true,
    [".king_ouroboros"] = true,
    [".litra"] = true,
    [".lockbit"] = true,
    [".locked"] = true,
    [".locked-"] = true,
    [".lockify"] = true,
    [".locky"] = true,
    [".losers"] = true,
    [".lotr"] = true,
    [".mamo434376"] = true,
    [".matrix"] = true,
    [".nm4"] = true,
    [".nsmf"] = true,
    [".obfuscated"] = true,
    [".ohno!"] = true,
    [".oops"] = true,
    [".osiris"] = true,
    [".oxr"] = true,
    [".pewcrypt"] = true,
    [".phobos"] = true,
    [".protected"] = true,
    [".qtyu8vh5wdxf6oswam5nua==obck"] = true,
    [".ryk"] = true,
    [".sad"] = true,
    [".sage"] = true,
    [".salsa222"] = true,
    [".satan"] = true,
    [".saturn"] = true,
    [".satyr"] = true,
    [".sb_locked"] = true,
    [".se"] = true,
    [".shrug"] = true,
    [".shutupanddance"] = true,
    [".skystars"] = true,
    [".sykffle"] = true,
    [".sysdown"] = true,
    [".thanatos"] = true,
    [".tron"] = true,
    [".via"] = true,
    [".waffle"] = true,
    [".wamarlocked"] = true,
    [".wasted"] = true,
    [".whycry"] = true,
    [".wndie"] = true,
    [".wsmile"] = true,
    [".xcri"] = true,
    [".xf4g-vbrt-3v78"] = true,
    [".xort"] = true,
    [".yc5pdbhp"] = true,
    [".zorro"] = true
  }
  local l_0_7 = {
    [".[cho.dambler@yandex.com]"] = true,
    [".[jackie7@asia.com]"] = true,
    [".mailto[sevenoneone@cock.li].b6d27"] = true,
    [".trevinomason1@mail.com.vsunit"] = true
  }
  for l_0_8 = 1, l_0_1 do
    if sigattr_tail[l_0_8].attribute == 16384 and sigattr_tail[l_0_8].utf8p1:byte(1) ~= 37 then
      local l_0_9 = sigattr_tail[l_0_8].utf8p1:lower()
      local l_0_10 = l_0_9:match("[^\\]+$")
      local l_0_11, l_0_12 = l_0_10:gsub("%.", ".")
      if 2 <= l_0_12 and l_0_0[l_0_9] == nil then
        l_0_0[l_0_9] = l_0_8
        local l_0_13, l_0_14 = l_0_10:match("^(.+)%.(.+)$")
        if not isnull(l_0_14) then
          l_0_14 = "." .. l_0_14
          local l_0_15 = false
          if l_0_6[l_0_14] == true then
            l_0_15 = true
          else
            for l_0_16, l_0_17 in pairs(l_0_7) do
              if string.find(l_0_10, l_0_16, 1, true) then
                l_0_14 = l_0_16
                l_0_15 = true
                break
              end
            end
          end
          if l_0_15 == true then
            if l_0_2[l_0_14] ~= nil then
              table.insert(l_0_2[l_0_14], l_0_8)
            else
              l_0_2[l_0_14] = {l_0_8}
            end
            if 3 <= #l_0_2[l_0_14] then
              local l_0_18 = {}
              local l_0_19 = {}
              local l_0_20 = bm.get_imagepath()
              if isnull(l_0_20) then
                l_0_20 = "NA"
              else
                l_0_20 = l_0_20:lower()
              end
              local l_0_21 = bm.get_current_process_startup_info()
              if l_0_21 ~= nil then
                l_0_21 = l_0_21.ppid
              else
                l_0_21 = "NA"
              end
              for l_0_22, l_0_23 in pairs(l_0_2[l_0_14]) do
                for l_0_24, l_0_25 in ipairs(split(l_0_23, "||")) do
                  table.insert(l_0_19, sigattr_tail[tonumber(l_0_25)].utf8p1)
                end
              end
              l_0_18.file_list = l_0_19
              l_0_18.cur_image_path = l_0_20
              l_0_18.proc_info = l_0_21
              l_0_18.appended_ext = l_0_14
              l_0_18.magic_mismatch = false
              l_0_18.sig_count = bm.get_sig_count()
              local l_0_26 = safeJsonSerialize(l_0_18)
              bm.add_related_string("gensbsim_ransom_meta", l_0_26, bm.RelatedStringBMReport)
              reportGenericRansomware(l_0_26, true)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
