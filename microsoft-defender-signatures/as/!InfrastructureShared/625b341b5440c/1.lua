-- Threat: !InfrastructureShared
-- Name: 625b341b5440c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = bm.get_imagepath():lower()
if l_0_2 == nil then
  return mp.CLEAN
end
if IsExcludedByImagePath(l_0_2) then
  return mp.CLEAN
end
if string.find(l_0_2, "/java", 1, true) or string.find(l_0_2, "/PXEngine/", 1, true) then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil or l_0_3.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_3.ppid, true) then
  return mp.CLEAN
end
for l_0_4 = 1, l_0_0 do
  if sigattr_tail[l_0_4].attribute == 16385 then
    local l_0_5 = sigattr_tail[l_0_4].utf8p1:lower()
    l_0_1[mp.crc32(0, l_0_5, 1, #l_0_5)] = 1
  end
end
local l_0_6 = {}
local l_0_7 = {}
for l_0_8 = 1, l_0_0 do
  if sigattr_tail[l_0_8].attribute == 16386 then
    local l_0_9 = sigattr_tail[l_0_8].utf8p2:lower()
    local l_0_10 = sigattr_tail[l_0_8].utf8p1:lower()
    if l_0_9 ~= nil and l_0_10 ~= nil then
      local l_0_11 = mp.crc32(0, l_0_9, 1, #l_0_9)
      local l_0_12 = mp.crc32(0, l_0_10, 1, #l_0_10)
      if (l_0_1[l_0_12] ~= nil or l_0_1[l_0_11] ~= nil) and l_0_7[l_0_11] == nil then
        local l_0_13 = l_0_9:match("%.[^/%.]+$")
        if l_0_13 ~= nil and mp.GetExtensionClass(l_0_13) ~= 3 and #l_0_9 < #l_0_10 and l_0_10:find(l_0_9, 1, true) == 1 and l_0_10:byte(#l_0_9 + 1) == 46 and l_0_10:byte(#l_0_9 + 1) ~= 58 then
          l_0_7[l_0_11] = 1
          local l_0_14 = l_0_10:match("%.[^/%.]+$")
          if l_0_14 ~= nil and mp.GetExtensionClass(l_0_14) ~= 4 and IsExcludedByImagePathFileExtension(l_0_2, l_0_14) == false and IsExcludedByImagePathFileExtensionRegEx(l_0_2, l_0_14) == false and IsExtensionDatePattern(l_0_14) == false then
            local l_0_15 = string.sub(l_0_10, #l_0_9 + 1)
            if l_0_6[l_0_15] ~= nil then
              table.insert(l_0_6[l_0_15], l_0_8)
              if 5 <= #l_0_6[l_0_15] then
                bm.add_related_string("ransom_extension", l_0_15, bm.RelatedStringBMReport)
                local l_0_16 = "genb_linux_ransom_meta"
                local l_0_17 = {}
                AppendToRollingQueue(l_0_16, "cur_image_path", l_0_2)
                AppendToRollingQueue(l_0_16, "proc_info", l_0_3.ppid)
                AppendToRollingQueue(l_0_16, "appended_ext", l_0_15)
                for l_0_18, l_0_19 in pairs(l_0_6[l_0_15]) do
                  bm.add_related_file(sigattr_tail[l_0_19].utf8p1)
                  table.insert(l_0_17, sigattr_tail[l_0_19].utf8p1)
                end
                local l_0_20 = table.concat(l_0_17, ",")
                AppendToRollingQueue(l_0_16, "renamed_file_path", l_0_20)
                bm.add_related_string("file_metadata", l_0_20, bm.RelatedStringBMReport)
                bm.add_related_string("cur_image_path", l_0_2, bm.RelatedStringBMReport)
                addRelatedProcess()
                reportRelatedBmHits()
                TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
                bm.trigger_sig("GenericLinuxRansomware", "Type5")
                return mp.INFECTED
              end
            else
              l_0_6[l_0_15] = {l_0_8}
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
