-- Threat: !InfrastructureShared
-- Name: 715b358396d55
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 150000000
if l_0_1 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = bm.get_imagepath():lower()
if l_0_3 == nil or l_0_3 == "" or IsExcludedByImagePath(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = bm.get_current_process_startup_info()
if l_0_4 ~= nil then
  l_0_4 = l_0_4.ppid
else
  l_0_4 = "-1"
end
if isParentPackageManager(l_0_4, true) then
  return mp.CLEAN
end
for l_0_5 = 1, l_0_0 do
  if sigattr_tail[l_0_5].attribute == 16385 then
    local l_0_6 = sigattr_tail[l_0_5].utf8p1:lower()
    l_0_2[mp.crc32(0, l_0_6, 1, #l_0_6)] = 1
  end
end
local l_0_7 = {}
local l_0_8 = {}
for l_0_9 = 1, l_0_0 do
  if sigattr_tail[l_0_9].attribute == 16386 then
    local l_0_10 = sigattr_tail[l_0_9].utf8p2:lower()
    local l_0_11 = sigattr_tail[l_0_9].utf8p1:lower()
    local l_0_12 = mp.crc32(0, l_0_10, 1, #l_0_10)
    local l_0_13 = mp.crc32(0, l_0_11, 1, #l_0_11)
    if (l_0_2[l_0_13] ~= nil or l_0_2[l_0_12] ~= nil) and l_0_8[l_0_12] == nil then
      local l_0_14 = l_0_10:match("%.[^/%.]+$")
      if l_0_14 ~= nil and mp.GetExtensionClass(l_0_14) ~= 3 and #l_0_10 < #l_0_11 and l_0_11:find(l_0_10, 1, true) == 1 and l_0_11:byte(#l_0_10 + 1) == 46 and l_0_11:byte(#l_0_10 + 1) ~= 58 then
        l_0_8[l_0_12] = 1
        local l_0_15 = l_0_11:match("%.[^/%.]+$")
        if l_0_15 ~= nil and mp.GetExtensionClass(l_0_15) ~= 4 and IsExcludedByImagePathFileExtension(l_0_3, l_0_15) == false and IsExcludedByImagePathFileExtensionRegEx(l_0_3, l_0_15) == false and IsExcludedByImagePathFileExtensionSuffix(l_0_3, l_0_15) == false and IsExtensionDatePattern(l_0_15) == false then
          local l_0_16 = string.sub(l_0_11, #l_0_10 + 1)
          if l_0_7[l_0_16] ~= nil then
            table.insert(l_0_7[l_0_16], l_0_9)
            if 10 <= #l_0_7[l_0_16] then
              bm.add_related_string("ransom_extension", l_0_16, bm.RelatedStringBMReport)
              local l_0_17 = "genj_linux_ransom_meta"
              local l_0_18 = {}
              AppendToRollingQueue(l_0_17, "cur_image_path", l_0_3)
              AppendToRollingQueue(l_0_17, "proc_info", l_0_4)
              AppendToRollingQueue(l_0_17, "appended_ext", l_0_16)
              for l_0_19, l_0_20 in pairs(l_0_7[l_0_16]) do
                bm.add_related_file(sigattr_tail[l_0_20].utf8p1)
                table.insert(l_0_18, sigattr_tail[l_0_20].utf8p1)
              end
              local l_0_21 = table.concat(l_0_18, ",")
              AppendToRollingQueue(l_0_17, "renamed_file_path", l_0_21)
              bm.add_related_string("file_metadata", l_0_21, bm.RelatedStringBMReport)
              addRelatedProcess()
              reportRelatedBmHits()
              TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
              return mp.INFECTED
            end
          else
            l_0_7[l_0_16] = {l_0_9}
          end
        end
      end
    end
  end
end
return mp.CLEAN
