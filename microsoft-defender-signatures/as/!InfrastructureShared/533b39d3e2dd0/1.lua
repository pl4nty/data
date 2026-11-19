-- Threat: !InfrastructureShared
-- Name: 533b39d3e2dd0
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
for l_0_5 = 1, l_0_0 do
  local l_0_6 = sigattr_tail[l_0_5].utf8p2
  if sigattr_tail[l_0_5].attribute == 16385 and sigattr_tail[l_0_5].utf8p1:byte(1) ~= 37 and l_0_6:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1:lower()
    local l_0_8 = l_0_7:match("%.[^%.]+$")
    if l_0_8 and mp.bitand(mp.GetExtensionClass(l_0_8), 3) ~= 0 then
      local l_0_9 = 5 < l_0_5 and l_0_5 - 5 or 1
      local l_0_10 = l_0_0 < l_0_9 + 10 and l_0_9 + 10 or l_0_0
      for l_0_11 = l_0_9, l_0_10 do
        if sigattr_tail[l_0_11].attribute == 16525 and sigattr_tail[l_0_5].utf8p1 == sigattr_tail[l_0_11].utf8p1 then
          local l_0_12 = {}
          if l_0_1[l_0_7] == nil then
            l_0_1[l_0_7] = l_0_5
            for l_0_13, l_0_14 in string.gmatch(l_0_6, "(%w+):(%w+)") do
              l_0_12[l_0_13] = l_0_14
            end
            local l_0_15 = l_0_12.TotalSizeAppend and tonumber(l_0_12.TotalSizeAppend) or 0
            if 0 < l_0_15 then
              if 16 < l_0_15 then
                l_0_4 = l_0_4 + 1
              end
              local l_0_16 = l_0_12.LastOff and tonumber(l_0_12.LastOff) or 0
              local l_0_17 = l_0_12.FirstOff and tonumber(l_0_12.FirstOff) or 0
              local l_0_18 = l_0_12.NumWrites and tonumber(l_0_12.NumWrites) or 0
              local l_0_19 = l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0
              local l_0_20 = l_0_12.SmallestOff and tonumber(l_0_12.SmallestOff) or 0
              local l_0_21 = l_0_12.TotalSizeWrite and tonumber(l_0_12.TotalSizeWrite) or 0
              if l_0_19 ~= 0 and l_0_17 == 0 and l_0_20 == 0 and l_0_19 == l_0_16 and l_0_16 + 1 == l_0_21 and 0 < l_0_18 and 0 < l_0_15 and l_0_15 <= 16 then
                if 10 <= l_0_3 then
                  break
                elseif l_0_3 < 10 then
                  l_0_12.path = l_0_7
                  l_0_2[l_0_5] = l_0_12
                end
                l_0_3 = l_0_3 + 1
              end
            end
          end
        end
      end
    end
  end
end
local l_0_22 = {}
local l_0_23 = 0
if l_0_4 == 0 and 10 <= l_0_3 then
  for l_0_24, l_0_25 in pairs(l_0_2) do
    local l_0_26 = sigattr_tail[l_0_24].utf8p1
    local l_0_27 = sysio.GetFileSize(l_0_26)
    if l_0_27 ~= nil and 256 < l_0_27 then
      local l_0_28 = sysio.ReadFile(l_0_26, 0, 256)
      if l_0_28 ~= nil then
        local l_0_29 = string.format("\\x%02X\\x%02X\\x%02X\\x%02X", string.byte(l_0_28, 1, 4))
        local l_0_30 = crypto.ComputeEntropy(l_0_28)
        table.insert(l_0_22, {
          FilePath = l_0_26,
          Filesize = l_0_27,
          MagicByte = l_0_29,
          Entropy = l_0_30,
          AppendedSize = tonumber(l_0_25.TotalSizeAppend),
          WriteSize = tonumber(l_0_25.TotalSizeWrite)
        })
        l_0_23 = l_0_23 + 1
      end
    end
    if 5 <= l_0_23 then
      local l_0_31 = {}
      l_0_31.gen_ransom_data = l_0_22
      local l_0_32 = safeJsonSerialize(l_0_31)
      bm.add_related_string("genfb_ransom_meta", l_0_32, bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:FileAppendBucket1:16", l_0_32)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
