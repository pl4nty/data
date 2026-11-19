-- Threat: !InfrastructureShared
-- Name: 2c2b36871661c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = bm.get_sig_count()
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = l_0_6:match("[^\\]+$")
if not l_0_7 or l_0_7 ~= "python.exe" then
  return mp.CLEAN
end
if not IsProcNameInParentProcessTree("BM", "ai_exec_server.exe") and not IsProcNameInParentProcessTree("BM", "airuncommandasuser.exe") then
  return mp.CLEAN
end
for l_0_8 = 1, l_0_0 do
  if sigattr_tail[l_0_8].utf8p1 and sigattr_tail[l_0_8].utf8p1:byte(1) ~= 37 then
    if sigattr_tail[l_0_8].attribute == 16387 then
      local l_0_9 = sigattr_tail[l_0_8].utf8p1:lower()
      if l_0_4[l_0_9] == nil then
        l_0_4[l_0_9] = l_0_8
        l_0_2 = l_0_2 + 1
      end
    elseif sigattr_tail[l_0_8].attribute == 16385 then
      local l_0_10 = sigattr_tail[l_0_8].utf8p1:lower()
      if l_0_5[l_0_10] == nil then
        l_0_5[l_0_10] = l_0_8
        l_0_3 = l_0_3 + 1
      end
    end
  end
end
if l_0_2 < 5 or l_0_3 < 5 then
  return mp.CLEAN
end
local l_0_11 = 0
local l_0_12 = {}
local l_0_13 = {}
for l_0_14 = 1, l_0_0 do
  if sigattr_tail[l_0_14].attribute == 16384 and sigattr_tail[l_0_14].utf8p1 and sigattr_tail[l_0_14].utf8p1:byte(1) ~= 37 then
    local l_0_15 = sigattr_tail[l_0_14].utf8p1:lower()
    if l_0_13[l_0_15] == nil then
      l_0_13[l_0_15] = l_0_14
      local l_0_16 = l_0_15:match("[^\\]+$")
      local l_0_17, l_0_18 = l_0_16:gsub("%.", ".")
      if 2 <= l_0_18 then
        local l_0_19 = l_0_16:match("%.[^%.]+$")
        if l_0_12[l_0_19] ~= nil then
          table.insert(l_0_12[l_0_19], l_0_14)
        else
          l_0_12[l_0_19] = {l_0_14}
        end
        l_0_11 = l_0_11 + 1
      end
    end
  end
end
if l_0_11 < 5 then
  return mp.CLEAN
end
local l_0_20 = {}
for l_0_21, l_0_22 in pairs(l_0_12) do
  if 4 <= #l_0_12[l_0_21] then
    local l_0_23 = string.len(l_0_21)
    for l_0_24, l_0_25 in pairs(l_0_22) do
      local l_0_26 = sigattr_tail[l_0_25].utf8p1:lower()
      if l_0_4[l_0_26] ~= nil then
        local l_0_27 = string.len(l_0_26)
        if l_0_23 < l_0_27 then
          local l_0_28 = string.sub(l_0_26, 1, l_0_27 - l_0_23)
          if l_0_5[l_0_28] then
            table.insert(l_0_20, l_0_28)
            if 4 <= #l_0_20 then
              local l_0_29 = {}
              for l_0_30, l_0_31 in pairs(l_0_20) do
                table.insert(l_0_29, l_0_31)
              end
              local l_0_32 = bm.get_imagepath()
              if isnull(l_0_32) then
                l_0_32 = "NA"
              else
                l_0_32 = l_0_32:lower()
              end
              local l_0_33 = bm.get_current_process_startup_info()
              if isnull(l_0_33) then
                l_0_33 = "NA"
              else
                l_0_33 = l_0_33.ppid
              end
              local l_0_34 = {}
              l_0_34.file_list = l_0_29
              l_0_34.sig_count = l_0_1
              l_0_34.proc_info = l_0_33
              l_0_34.cur_image_path = l_0_32
              local l_0_35 = safeJsonSerialize(l_0_34)
              bm.add_related_string("genq_ransom_meta", l_0_35, bm.RelatedStringBMReport)
              reportGenericRansomware(l_0_35, true)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
