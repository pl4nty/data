-- Threat: !InfrastructureShared
-- Name: 2e9b3f103c735
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = 0
local l_0_9 = {}
local l_0_10 = bm.get_sig_count()
for l_0_11 = 1, l_0_0 do
  local l_0_12 = sigattr_tail[l_0_11].attribute
  if l_0_12 == 16384 then
    local l_0_13 = sigattr_tail[l_0_11].utf8p1:lower()
    local l_0_14 = l_0_13:match("%.[^%.]+$")
    if l_0_14 ~= nil and (mp.GetExtensionClass(l_0_14) ~= 4 or isKnownRansomExtension(l_0_14)) then
      local l_0_15 = mp.crc32(0, l_0_13, 1, #l_0_13)
      if l_0_1[l_0_15] ~= nil then
        table.insert(l_0_1[l_0_15], l_0_11)
      else
        l_0_1[l_0_15] = {l_0_11}
        l_0_8 = l_0_8 + 1
      end
    end
  end
end
if l_0_8 < 5 then
  return mp.CLEAN
end
for l_0_16 = 1, l_0_0 do
  local l_0_17 = sigattr_tail[l_0_16].attribute
  if l_0_17 == 16389 then
    local l_0_18 = sigattr_tail[l_0_16].utf8p1:lower()
    local l_0_19 = mp.crc32(0, l_0_18, 1, #l_0_18)
    if l_0_3[l_0_19] ~= nil then
      table.insert(l_0_3[l_0_19], l_0_16)
    else
      l_0_3[l_0_19] = {l_0_16}
    end
    if l_0_1[l_0_19] ~= nil then
      local l_0_20 = string.find(l_0_18, "\\[^\\]*$") or 0
      local l_0_21 = string.find(l_0_18, ".", l_0_20, true)
      if l_0_21 ~= nil then
        local l_0_22 = string.sub(l_0_18, l_0_20 + 1, l_0_21 - 1)
        if l_0_22 ~= nil then
          if l_0_4[l_0_22] == nil then
            l_0_4[l_0_22] = {l_0_19, l_0_16}
          else
            table.insert(l_0_4[l_0_22], l_0_16)
          end
        end
      end
    end
  end
end
l_0_8 = 0
local l_0_23 = {}
for l_0_24 = 1, l_0_0 do
  local l_0_25 = sigattr_tail[l_0_24].attribute
  if l_0_25 == 16387 then
    local l_0_26 = sigattr_tail[l_0_24].utf8p1:lower()
    local l_0_27 = mp.crc32(0, l_0_26, 1, #l_0_26)
    if l_0_1[l_0_27] == nil then
      table.insert(l_0_2, l_0_24)
    else
      l_0_3[l_0_27] = nil
    end
    if l_0_23[l_0_27] == nil then
      l_0_8 = l_0_8 + 1
      l_0_23[l_0_27] = 1
    end
  end
end
if l_0_8 < 5 then
  return mp.CLEAN
end
for l_0_28, l_0_29 in pairs(l_0_2) do
  local l_0_30 = sigattr_tail[l_0_29].utf8p1:lower()
  local l_0_31 = string.find(l_0_30, "\\[^\\]*$") or 0
  local l_0_32 = string.find(l_0_30, ".", l_0_31, true)
  if l_0_32 ~= nil then
    local l_0_33 = string.sub(l_0_30, l_0_31 + 1, -1)
    local l_0_34 = string.sub(l_0_30, l_0_31 + 1, l_0_32 - 1)
    local l_0_35
    if l_0_33 ~= nil then
      l_0_35 = l_0_33:match("%.[^%.]+$")
    end
    if l_0_34 ~= nil and l_0_35 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_35), 3) ~= 0 and l_0_4[l_0_34] ~= nil then
      local l_0_36 = l_0_4[l_0_34][1]
      if l_0_3[l_0_36] ~= nil then
        local l_0_37 = sigattr_tail[l_0_3[l_0_36][1]].utf8p1:lower()
        if l_0_1[l_0_36] ~= nil and l_0_1[l_0_36][1] then
          l_0_7[l_0_29] = l_0_1[l_0_36][1]
        end
        if #l_0_37 > #l_0_30 and l_0_37:find(l_0_30, 1, true) == 1 and l_0_37:byte(#l_0_30 + 1) ~= 58 then
          local l_0_38 = string.sub(l_0_37, #l_0_30 + 1)
          if l_0_5[l_0_38] ~= nil then
            if l_0_6[l_0_36] == nil then
              l_0_6[l_0_36] = 1
              table.insert(l_0_5[l_0_38], l_0_3[l_0_36][1])
              table.insert(l_0_5[l_0_38], l_0_29)
              if 10 <= #l_0_5[l_0_38] then
                local l_0_39 = false
                local l_0_40 = {}
                l_0_40.count = 0
                for l_0_41, l_0_42 in pairs(l_0_5[l_0_38]) do
                  local l_0_43 = sysio.ReadFile(sigattr_tail[l_0_42].utf8p1, 0, 4)
                  if l_0_43 ~= nil and l_0_40[l_0_43] == nil then
                    l_0_40[l_0_43] = 1
                    l_0_40.count = l_0_40.count + 1
                  end
                end
                if 4 < l_0_40.count then
                  l_0_39 = true
                end
                bm.add_related_string("magic_mismatch", tostring(l_0_39), bm.RelatedStringBMReport)
                bm.add_related_string("ransom_extension", l_0_38, bm.RelatedStringBMReport)
                local l_0_44 = {}
                local l_0_45 = {}
                local l_0_46 = {}
                local l_0_47 = bm.get_imagepath()
                if isnull(l_0_47) then
                  l_0_47 = "NA"
                else
                  l_0_47 = l_0_47:lower()
                end
                local l_0_48 = bm.get_current_process_startup_info()
                if l_0_48 ~= nil then
                  l_0_48 = l_0_48.ppid
                else
                  l_0_48 = -1
                end
                l_0_44.cur_image_path = l_0_47
                l_0_44.proc_info = l_0_48
                l_0_44.appended_ext = l_0_38
                l_0_44.magic_mismatch = l_0_39
                l_0_44.sig_count = l_0_10
                l_0_44.debug_data = l_0_9
                local l_0_49 = "FileChain_MainSet:"
                for l_0_50, l_0_51 in pairs(l_0_5[l_0_38]) do
                  local l_0_52 = sigattr_tail[l_0_51].utf8p1
                  local l_0_53 = string.find(l_0_52, "\\[^\\]*$") or 0
                  local l_0_54 = string.find(l_0_52, ".", l_0_53, true)
                  if l_0_54 ~= nil then
                    local l_0_55 = string.sub(l_0_52, l_0_53 + 1, l_0_54 - 1)
                    l_0_49 = l_0_49 .. crypto.CRC32Buffer(-1, l_0_55, 0, #l_0_55)
                    l_0_49 = l_0_49 .. ";" .. string.sub(l_0_52, l_0_54 + 1) .. ";"
                  end
                  table.insert(l_0_45, sigattr_tail[l_0_51].utf8p1)
                  local l_0_56
                  if l_0_7[l_0_51] ~= nil then
                    if sigattr_tail[l_0_7[l_0_51]] ~= nil then
                      local l_0_57 = sigattr_tail[l_0_7[l_0_51]].utf8p1:lower()
                      local l_0_58 = sigattr_tail[l_0_7[l_0_51]].utf8p2:lower()
                      l_0_56 = string.match(l_0_58, "fsize:(%d+)")
                      if l_0_56 == nil then
                        l_0_56 = -1
                      end
                      table.insert(l_0_46, l_0_57)
                      table.insert(l_0_46, l_0_56)
                    end
                    if sigattr_tail[l_0_51] ~= nil then
                      local l_0_59 = sigattr_tail[l_0_51].utf8p1:lower()
                      local l_0_60 = sigattr_tail[l_0_51].utf8p2:lower()
                      l_0_56 = string.match(l_0_60, "fsize:(%d+)")
                      if l_0_56 == nil then
                        l_0_56 = -1
                      end
                      table.insert(l_0_46, l_0_59)
                      table.insert(l_0_46, l_0_56)
                    end
                  end
                end
                l_0_44.file_list = l_0_45
                l_0_44.file_size = l_0_46
                local l_0_61, l_0_62 = bm.get_process_relationships()
                for l_0_63, l_0_64 in ipairs(l_0_61) do
                  if l_0_64.image_path ~= nil then
                    bm.add_related_process(l_0_64.ppid)
                  end
                end
                for l_0_65, l_0_66 in ipairs(l_0_62) do
                  if l_0_66.image_path ~= nil then
                    bm.add_related_process(l_0_66.ppid)
                  end
                end
                bm.add_related_string("ransom_files_main", l_0_49, bm.RelatedStringBMReport)
                local l_0_67 = safeJsonSerialize(l_0_44)
                bm.add_related_string("gend_ransom_meta", l_0_67, bm.RelatedStringBMReport)
                bm.add_related_string("sigcount_type4", l_0_10, bm.RelatedStringBMReport)
                return mp.INFECTED
              end
            end
          else
            l_0_5[l_0_38] = {
              l_0_3[l_0_36][1],
              l_0_29
            }
            l_0_6[l_0_36] = 1
          end
        end
      end
    end
  end
end
return mp.CLEAN
