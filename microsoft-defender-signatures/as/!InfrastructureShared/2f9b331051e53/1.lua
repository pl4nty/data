-- Threat: !InfrastructureShared
-- Name: 2f9b331051e53
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = 0
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = mp.SIGATTR_LOG_SZ
local l_0_5 = {}
local l_0_6 = bm.get_imagepath()
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = string.lower(MpCommon.PathToWin32Path(l_0_6))
local l_0_8 = StringSplit(l_0_7, "\\")
if 7 < #l_0_8 and checkFileLastWriteTime(l_0_7, 120) == false then
  for l_0_9 = 1, l_0_4 do
    if sigattr_tail[l_0_9].attribute == 16384 and sigattr_tail[l_0_9].utf8p1:byte(1) ~= 37 then
      local l_0_10 = sigattr_tail[l_0_9].utf8p1:lower()
      local l_0_11 = l_0_10:match("%.[^%.]+$")
      if l_0_11 ~= nil then
        local l_0_12 = mp.GetExtensionClass(l_0_11)
        if l_0_12 ~= 4 then
          local l_0_13 = l_0_10:match("[^\\]+$")
          local l_0_14, l_0_15 = l_0_13:gsub("%.", ".")
          if l_0_12 == 0 and 2 <= l_0_15 and l_0_0[l_0_10] == nil then
            l_0_0[l_0_10] = l_0_9
            l_0_1 = l_0_1 + 1
          elseif l_0_15 == 1 and l_0_2[l_0_10] == nil then
            l_0_2[l_0_10] = l_0_9
            l_0_3 = l_0_3 + 1
          end
        end
      end
    end
  end
  local l_0_16 = {
    [".aes"] = true,
    [".amnesia"] = true,
    [".arena"] = true,
    [".artemy"] = true,
    [".bitkangoroo"] = true,
    [".bomber"] = true,
    [".bworm"] = true,
    [".cerber"] = true,
    [".chip"] = true,
    [".clop"] = true,
    [".code"] = true,
    [".crab"] = true,
    [".crazy"] = true,
    [".crrrt"] = true,
    [".cry"] = true,
    [".crypt12"] = true,
    [".crypt888"] = true,
    [".crypted"] = true,
    [".cryptolocker"] = true,
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
    [".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true,
    [".flyper"] = true,
    [".frog"] = true,
    [".frs"] = true,
    [".ftcode"] = true,
    [".fun"] = true,
    [".garrantydecrypt"] = true,
    [".ghost"] = true,
    [".godra"] = true,
    [".gollum"] = true,
    [".hainhc"] = true,
    [".havoccrypt"] = true,
    [".hcked"] = true,
    [".hilda!"] = true,
    [".horros"] = true,
    [".ipygh"] = true,
    [".jaff"] = true,
    [".james"] = true,
    [".jkhnhu"] = true,
    [".jnec"] = true,
    [".josep"] = true,
    [".killrabbit"] = true,
    [".litra"] = true,
    [".locked"] = true,
    [".locked-"] = true,
    [".lockify"] = true,
    [".locky"] = true,
    [".losers"] = true,
    [".lotr"] = true,
    [".mailto[sevenoneone@cock.li].b6d27"] = true,
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
    [".se"] = true,
    [".shrug"] = true,
    [".shutupanddance"] = true,
    [".skystars"] = true,
    [".sysdown"] = true,
    [".thanatos"] = true,
    [".trevinomason1@mail.com.vsunit"] = true,
    [".tron"] = true,
    [".via"] = true,
    [".waffle"] = true,
    [".wamarlocked"] = true,
    [".whycry"] = true,
    [".wndie"] = true,
    [".wsmile"] = true,
    [".xcri"] = true,
    [".xf4g-vbrt-3v78"] = true,
    [".xort"] = true,
    [".yc5pdbhp"] = true,
    [".zorro"] = true,
    [".[cho.dambler@yandex.com]"] = true,
    [".[jackie7@asia.com]"] = true
  }
  if 4 <= l_0_1 and 4 <= l_0_3 then
    for l_0_17, l_0_18 in pairs(l_0_0) do
      local l_0_19, l_0_20 = l_0_17:match("^(.+)%.(.+)$")
      l_0_20 = "." .. l_0_20
      if not isnull(l_0_19) and l_0_16[l_0_20] == true then
        local l_0_21 = l_0_2[l_0_19]
        if not isnull(l_0_21) then
          if l_0_5[l_0_20] ~= nil then
            table.insert(l_0_5[l_0_20], tostring(l_0_21) .. "||" .. tostring(l_0_18))
          else
            l_0_5[l_0_20] = {
              tostring(l_0_21) .. "||" .. tostring(l_0_18)
            }
          end
          if 4 <= #l_0_5[l_0_20] then
            local l_0_22 = {}
            local l_0_23 = {}
            local l_0_24 = bm.get_imagepath()
            if isnull(l_0_24) then
              l_0_24 = "NA"
            else
              l_0_24 = l_0_24:lower()
            end
            local l_0_25 = bm.get_current_process_startup_info()
            if l_0_25 ~= nil then
              l_0_25 = l_0_25.ppid
            else
              l_0_25 = "NA"
            end
            for l_0_26, l_0_27 in pairs(l_0_5[l_0_20]) do
              for l_0_28, l_0_29 in ipairs(split(l_0_27, "||")) do
                table.insert(l_0_23, sigattr_tail[tonumber(l_0_29)].utf8p1)
              end
            end
            l_0_22.file_list = l_0_23
            l_0_22.cur_image_path = l_0_24
            l_0_22.proc_info = l_0_25
            l_0_22.appended_ext = l_0_20
            l_0_22.magic_mismatch = false
            l_0_22.sig_count = bm.get_sig_count()
            local l_0_30 = safeJsonSerialize(l_0_22)
            bm.add_related_string("gensbsim_ransom_meta", l_0_30, bm.RelatedStringBMReport)
            reportGenericRansomware(l_0_30, true)
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
