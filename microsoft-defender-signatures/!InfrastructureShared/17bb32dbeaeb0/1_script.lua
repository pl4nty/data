-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17bb32dbeaeb0\1_luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = ((bm.get_imagepath)()):lower()
if l_0_0 == nil or l_0_0 == "" or IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  l_0_1 = l_0_1.ppid
else
  l_0_1 = "-1"
end
if isParentPackageManager(l_0_1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.SIGATTR_LOG_SZ
local l_0_3 = {}
for l_0_7 = 1, l_0_2 do
  if (sigattr_tail[l_0_7]).attribute == 16385 then
    local l_0_8 = ((sigattr_tail[l_0_7]).utf8p1):lower()
    if IsPathIncludedLinuxRansomCheck(l_0_8) then
      l_0_3[(mp.crc32)(0, l_0_8, 1, #l_0_8)] = 1
    end
  end
end
local l_0_9 = {}
do
  local l_0_10 = {}
  for l_0_14 = 1, l_0_2 do
    if (sigattr_tail[l_0_14]).attribute == 16386 then
      local l_0_15 = ((sigattr_tail[l_0_14]).utf8p2):lower()
      local l_0_16 = ((sigattr_tail[l_0_14]).utf8p1):lower()
      local l_0_17 = (mp.crc32)(0, l_0_15, 1, #l_0_15)
      local l_0_18 = (mp.crc32)(0, l_0_16, 1, #l_0_16)
      if (l_0_3[l_0_18] ~= nil or l_0_3[l_0_17] ~= nil) and l_0_10[l_0_17] == nil then
        local l_0_19 = l_0_15:match("%.[^/%.]+$")
        if l_0_19 ~= nil and (mp.GetExtensionClass)(l_0_19) ~= 3 and #l_0_15 < #l_0_16 and l_0_16:find(l_0_15, 1, true) == 1 and l_0_16:byte(#l_0_15 + 1) == 46 and l_0_16:byte(#l_0_15 + 1) ~= 58 then
          l_0_10[l_0_17] = 1
          local l_0_20 = l_0_16:match("%.[^/%.]+$")
          if l_0_20 ~= nil and (mp.GetExtensionClass)(l_0_20) ~= 4 and IsExtensionDatePattern(l_0_20) == false then
            local l_0_21 = (string.sub)(l_0_16, #l_0_15 + 1)
            if l_0_9[l_0_21] ~= nil then
              (table.insert)(l_0_9[l_0_21], l_0_14)
              if #l_0_9[l_0_21] >= 5 then
                (bm.add_related_string)("ransom_extension", l_0_21, bm.RelatedStringBMReport)
                local l_0_22 = "genh_linux_ransom_meta"
                local l_0_23 = {}
                local l_0_24 = ((bm.get_imagepath)()):lower()
                AppendToRollingQueue(l_0_22, "cur_image_path", l_0_24)
                AppendToRollingQueue(l_0_22, "proc_info", l_0_1)
                AppendToRollingQueue(l_0_22, "appended_ext", l_0_21)
                for l_0_28,l_0_29 in pairs(l_0_9[l_0_21]) do
                  (bm.add_related_file)((sigattr_tail[l_0_29]).utf8p1)
                  ;
                  (table.insert)(l_0_23, (sigattr_tail[l_0_29]).utf8p1)
                end
                local l_0_30 = (table.concat)(l_0_23, ",")
                AppendToRollingQueue(l_0_22, "renamed_file_path", l_0_30)
                ;
                (bm.add_related_string)("file_metadata", l_0_30, bm.RelatedStringBMReport)
                addRelatedProcess()
                reportRelatedBmHits()
                TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
                ;
                (bm.trigger_sig)("GenericLinuxRansomware", "Type7")
                return mp.INFECTED
              end
            else
              do
                do
                  local l_0_31 = {}
                  -- DECOMPILER ERROR at PC274: No list found for R17 , SetList fails

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

