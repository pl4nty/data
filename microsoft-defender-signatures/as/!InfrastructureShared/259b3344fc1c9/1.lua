-- Threat: !InfrastructureShared
-- Name: 259b3344fc1c9
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = {}
local l_0_8 = bm.get_sig_count()
for l_0_9 = 1, l_0_0 do
  local l_0_10 = sigattr_tail[l_0_9].attribute
  if l_0_10 == 16384 then
    local l_0_11 = sigattr_tail[l_0_9].utf8p1:lower()
    local l_0_12 = l_0_11:match("%.[^%.]+$")
    if l_0_12 ~= nil then
      l_0_12 = l_0_12 .. "\""
      if mp.GetExtensionClass(l_0_12) ~= 0 then
        local l_0_13 = mp.crc32(0, l_0_11, 1, #l_0_11)
        if l_0_1[l_0_13] ~= nil then
          table.insert(l_0_1[l_0_13], l_0_9)
        else
          l_0_1[l_0_13] = {l_0_9}
        end
        l_0_6 = l_0_6 + 1
      end
    end
  end
end
if l_0_6 < 5 then
  return mp.CLEAN
end
l_0_6 = 0
for l_0_14 = 1, l_0_0 do
  local l_0_15 = sigattr_tail[l_0_14].attribute
  if l_0_15 == 16387 then
    local l_0_16 = sigattr_tail[l_0_14].utf8p1:lower()
    local l_0_17 = mp.crc32(0, l_0_16, 1, #l_0_16)
    if l_0_1[l_0_17] == nil then
      l_0_6 = l_0_6 + 1
      local l_0_18 = string.find(l_0_16, "\\[^\\]*$") or 0
      local l_0_19 = string.find(l_0_16, ".", l_0_18, true)
      if l_0_19 ~= nil then
        local l_0_20 = string.sub(l_0_16, l_0_18 + 1, l_0_19 - 1)
        if l_0_20 ~= nil then
          if l_0_2[l_0_20] == nil then
            l_0_2[l_0_20] = {l_0_17, l_0_14}
          else
            table.insert(l_0_2[l_0_20], l_0_14)
          end
        end
      end
    end
  end
end
if l_0_6 < 5 then
  return mp.CLEAN
end
for l_0_21, l_0_22 in pairs(l_0_1) do
  local l_0_23 = l_0_22[1]
  local l_0_24 = sigattr_tail[l_0_23].utf8p1:lower()
  local l_0_25 = string.find(l_0_24, "\\[^\\]*$") or 0
  local l_0_26 = string.find(l_0_24, ".", l_0_25, true)
  if l_0_26 ~= nil then
    local l_0_27 = string.sub(l_0_24, l_0_25 + 1, -1)
    local l_0_28 = string.sub(l_0_24, l_0_25 + 1, l_0_26 - 1)
    local l_0_29
    if l_0_27 ~= nil then
      l_0_29 = l_0_27:match("%.[^%.]+$")
    end
    if l_0_28 ~= nil and l_0_29 ~= nil and mp.GetExtensionClass(l_0_29) ~= 0 and l_0_2[l_0_28] ~= nil then
      local l_0_30 = l_0_2[l_0_28][1]
      local l_0_31 = l_0_2[l_0_28][2]
      if l_0_1[l_0_30] == nil then
        local l_0_32 = sigattr_tail[l_0_31].utf8p1:lower()
        l_0_5[l_0_23] = l_0_31
        if #l_0_32 > #l_0_24 and l_0_32:find(l_0_24, 1, true) == 1 and l_0_32:byte(#l_0_24 + 1) ~= 58 then
          local l_0_33 = string.sub(l_0_32, #l_0_24 + 1)
          if l_0_3[l_0_33] ~= nil then
            if l_0_4[l_0_30] == nil then
              l_0_4[l_0_30] = 1
              table.insert(l_0_3[l_0_33], l_0_31)
              table.insert(l_0_3[l_0_33], l_0_23)
              if 10 <= #l_0_3[l_0_33] then
                local l_0_34 = {}
                l_0_34.count = 0
                for l_0_35, l_0_36 in pairs(l_0_3[l_0_33]) do
                  local l_0_37 = sysio.ReadFile(sigattr_tail[l_0_36].utf8p1, 0, 4)
                  if l_0_37 ~= nil and l_0_34[l_0_37] == nil then
                    l_0_34[l_0_37] = 1
                    l_0_34.count = l_0_34.count + 1
                  end
                end
                bm.add_related_string("ransom_extension", l_0_33, bm.RelatedStringBMReport)
                local l_0_38 = {}
                local l_0_39 = {}
                local l_0_40 = {}
                local l_0_41 = bm.get_imagepath()
                if isnull(l_0_41) then
                  l_0_41 = "NA"
                else
                  l_0_41 = l_0_41:lower()
                end
                local l_0_42 = bm.get_current_process_startup_info()
                if l_0_42 ~= nil then
                  l_0_42 = l_0_42.ppid
                else
                  l_0_42 = -1
                end
                l_0_38.cur_image_path = l_0_41
                l_0_38.proc_info = l_0_42
                l_0_38.appended_ext = l_0_33
                l_0_38.sig_count = l_0_8
                l_0_38.debug_data = l_0_7
                local l_0_43 = "FileChain_MainSet:"
                for l_0_44, l_0_45 in pairs(l_0_3[l_0_33]) do
                  local l_0_46 = sigattr_tail[l_0_45].utf8p1
                  local l_0_47 = string.find(l_0_46, "\\[^\\]*$") or 0
                  local l_0_48 = string.find(l_0_46, ".", l_0_47, true)
                  if l_0_48 ~= nil then
                    local l_0_49 = string.sub(l_0_46, l_0_47 + 1, l_0_48 - 1)
                    l_0_43 = l_0_43 .. crypto.CRC32Buffer(-1, l_0_49, 0, #l_0_49)
                    l_0_43 = l_0_43 .. ";" .. string.sub(l_0_46, l_0_48 + 1) .. ";"
                  end
                  table.insert(l_0_39, sigattr_tail[l_0_45].utf8p1)
                  local l_0_50
                  if l_0_5[l_0_45] ~= nil then
                    if sigattr_tail[l_0_5[l_0_45]] ~= nil then
                      local l_0_51 = sigattr_tail[l_0_5[l_0_45]].utf8p1:lower()
                      local l_0_52 = sigattr_tail[l_0_5[l_0_45]].utf8p2:lower()
                      l_0_50 = string.match(l_0_52, "fsize:(%d+)")
                      if l_0_50 == nil then
                        l_0_50 = -1
                      end
                      table.insert(l_0_40, l_0_51)
                      table.insert(l_0_40, l_0_50)
                    end
                    if sigattr_tail[l_0_45] ~= nil then
                      local l_0_53 = sigattr_tail[l_0_45].utf8p1:lower()
                      local l_0_54 = sigattr_tail[l_0_45].utf8p2:lower()
                      l_0_50 = string.match(l_0_54, "fsize:(%d+)")
                      if l_0_50 == nil then
                        l_0_50 = -1
                      end
                      table.insert(l_0_40, l_0_53)
                      table.insert(l_0_40, l_0_50)
                    end
                  end
                end
                l_0_38.file_list = l_0_39
                l_0_38.file_size = l_0_40
                bm.add_related_string("ransom_files_main", l_0_43, bm.RelatedStringBMReport)
                local l_0_55 = safeJsonSerialize(l_0_38)
                bm.add_related_string("gendrv_ransom_meta", l_0_55, bm.RelatedStringBMReport)
                bm.add_related_string("sigcount_type4_rv", l_0_8, bm.RelatedStringBMReport)
                reportSessionInformationInclusive()
                local l_0_56, l_0_57 = pcall(reportBmInfo)
                if not l_0_56 and l_0_57 then
                  bm.add_related_string("bmInfoFailReason", tostring(l_0_57), bm.RelatedStringBMReport)
                end
                return mp.INFECTED
              end
            end
          else
            l_0_3[l_0_33] = {l_0_31, l_0_23}
            l_0_4[l_0_30] = 1
          end
        end
      end
    end
  end
end
return mp.CLEAN
