-- Threat: !InfrastructureShared
-- Name: 4b3b37618308b
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = {}
local l_0_4 = {}
for l_0_5 = 1, l_0_0 do
  if sigattr_tail[l_0_5].utf8p1 and sigattr_tail[l_0_5].utf8p1:byte(1) ~= 37 then
    if sigattr_tail[l_0_5].attribute == 16387 then
      local l_0_6 = sigattr_tail[l_0_5].utf8p1:lower()
      if l_0_3[l_0_6] == nil then
        l_0_3[l_0_6] = l_0_5
        l_0_1 = l_0_1 + 1
      end
    elseif sigattr_tail[l_0_5].attribute == 16385 then
      local l_0_7 = sigattr_tail[l_0_5].utf8p1:lower()
      if l_0_4[l_0_7] == nil then
        l_0_4[l_0_7] = l_0_5
        l_0_2 = l_0_2 + 1
      end
    end
  end
end
if l_0_1 < 5 or l_0_2 < 5 then
  return mp.CLEAN
end
local l_0_8 = 0
local l_0_9 = {}
local l_0_10 = {}
for l_0_11 = 1, l_0_0 do
  if sigattr_tail[l_0_11].attribute == 16384 and sigattr_tail[l_0_11].utf8p1 and sigattr_tail[l_0_11].utf8p1:byte(1) ~= 37 then
    local l_0_12 = sigattr_tail[l_0_11].utf8p1:lower()
    if l_0_10[l_0_12] == nil then
      l_0_10[l_0_12] = l_0_11
      local l_0_13 = l_0_12:match("[^\\]+$")
      local l_0_14, l_0_15 = l_0_13:gsub("%.", ".")
      if 2 <= l_0_15 then
        local l_0_16 = l_0_13:match("%.[^%.]+$")
        if l_0_9[l_0_16] ~= nil then
          table.insert(l_0_9[l_0_16], l_0_11)
        else
          l_0_9[l_0_16] = {l_0_11}
        end
        l_0_8 = l_0_8 + 1
      end
    end
  end
end
if l_0_8 < 5 then
  return mp.CLEAN
end
local l_0_17 = {}
for l_0_18, l_0_19 in pairs(l_0_9) do
  if 5 <= #l_0_9[l_0_18] then
    local l_0_20 = string.len(l_0_18)
    for l_0_21, l_0_22 in pairs(l_0_19) do
      local l_0_23 = sigattr_tail[l_0_22].utf8p1:lower()
      if l_0_3[l_0_23] ~= nil then
        local l_0_24 = string.len(l_0_23)
        if l_0_20 < l_0_24 then
          local l_0_25 = string.sub(l_0_23, 1, l_0_24 - l_0_20)
          if l_0_4[l_0_25] then
            table.insert(l_0_17, l_0_25)
            if 5 <= #l_0_17 then
              local l_0_26 = {}
              for l_0_27, l_0_28 in pairs(l_0_17) do
                table.insert(l_0_26, {path = l_0_28})
              end
              local l_0_29 = {}
              l_0_29.file_paths = l_0_26
              l_0_29.backup_ext = l_0_18
              local l_0_30 = safeJsonSerialize(l_0_29)
              bm.trigger_sig("GenericRansomware:BackupEncRestore", l_0_30)
              bm.add_related_string("genh_ransom_meta", l_0_30, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
