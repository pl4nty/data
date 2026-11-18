-- Threat: !InfrastructureShared
-- Name: 1e9b33b60e893
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

function DefrayExtensionCheck(l_1_0)
  local l_1_1 = 0
  
  local l_1_2
  for l_1_3, l_1_4 in pairs(l_1_0) do
    local l_1_5, l_1_6 = l_1_3:match("([.%w]+)-([0-9a-fA-F]+)")
    if l_1_5 ~= nil and l_1_6 ~= nil and l_1_6:len() == 8 and l_1_5:len() > 3 then
      if l_1_2 == nil then
        l_1_2 = l_1_5
        l_1_1 = l_1_1 + 1
      elseif l_1_2 == l_1_5 then
        l_1_1 = l_1_1 + 1
      end
    end
  end
  return l_1_1
end

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
for l_0_2 = 1, l_0_0 do
  if sigattr_tail[l_0_2].attribute == 16385 then
    local l_0_3 = sigattr_tail[l_0_2].utf8p1:lower()
    l_0_1[mp.crc32(0, l_0_3, 1, #l_0_3)] = 1
  end
end
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = {}
local l_0_9 = 0
local l_0_10 = 8
for l_0_11 = 1, l_0_0 do
  if sigattr_tail[l_0_11].attribute == 16386 then
    local l_0_12 = sigattr_tail[l_0_11].utf8p2:lower()
    local l_0_13 = sigattr_tail[l_0_11].utf8p1:lower()
    local l_0_14 = mp.crc32(0, l_0_12, 1, #l_0_12)
    local l_0_15 = mp.crc32(0, l_0_13, 1, #l_0_13)
    if (l_0_1[l_0_15] ~= nil or l_0_1[l_0_14] ~= nil) and l_0_8[l_0_14] == nil then
      local l_0_16 = l_0_12:match("%.[^/%.]+$")
      if l_0_16 ~= nil and mp.GetExtensionClass(l_0_16) ~= 3 and #l_0_12 < #l_0_13 and l_0_13:find(l_0_12, 1, true) == 1 and l_0_13:byte(#l_0_12 + 1) ~= 58 then
        l_0_8[l_0_14] = 1
        local l_0_17 = l_0_13:match("%.[^/%.]+$")
        if mp.GetExtensionClass(l_0_17) ~= 4 and IsExtensionDatePattern(l_0_17) == false then
          local l_0_18 = string.sub(l_0_13, #l_0_12 + 1)
          if l_0_4[l_0_18] ~= nil then
            if l_0_5[l_0_18] ~= nil then
              l_0_5[l_0_18] = nil
              l_0_6 = l_0_6 - 1
            end
          else
            l_0_4[l_0_18] = {l_0_11}
            l_0_7 = l_0_7 + 1
            l_0_5[l_0_18] = {l_0_11}
            l_0_6 = l_0_6 + 1
          end
          if l_0_10 <= l_0_6 then
            l_0_9 = 1
            break
          end
        end
      end
    end
  end
end
if l_0_9 == 1 then
  local l_0_19 = "Type4"
  local l_0_20 = "genf_linux_ransom_meta"
  local l_0_21 = {}
  local l_0_22 = string.lower(bm.get_imagepath())
  local l_0_23 = bm.get_current_process_startup_info()
  if l_0_23 ~= nil then
    l_0_23 = l_0_23.ppid
  else
    l_0_23 = "-1"
  end
  AppendToRollingQueue(l_0_20, "cur_image_path", l_0_22)
  AppendToRollingQueue(l_0_20, "proc_info", l_0_23)
  local l_0_24 = DefrayExtensionCheck(l_0_5)
  if l_0_10 <= l_0_24 then
    l_0_19 = "Defray.GenF"
  end
  local l_0_25 = ""
  for l_0_26, l_0_27 in pairs(l_0_5) do
    l_0_25 = l_0_25 .. "," .. l_0_26
  end
  bm.add_related_string("ransom_extension", l_0_25, bm.RelatedStringBMReport)
  AppendToRollingQueue(l_0_20, "appended_ext", l_0_25)
  for l_0_28, l_0_29 in pairs(l_0_5) do
    for l_0_30, l_0_31 in pairs(l_0_5[l_0_28]) do
      bm.add_related_file(sigattr_tail[l_0_31].utf8p1)
      table.insert(l_0_21, sigattr_tail[l_0_31].utf8p1)
    end
  end
  AppendToRollingQueue(l_0_20, "renamed_file_path", table.concat(l_0_21, ","))
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  bm.trigger_sig("GenericLinuxRansomware", l_0_19)
  return mp.INFECTED
end
return mp.CLEAN
