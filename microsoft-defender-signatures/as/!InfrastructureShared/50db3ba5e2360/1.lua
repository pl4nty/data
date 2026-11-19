-- Threat: !InfrastructureShared
-- Name: 50db3ba5e2360
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
      local l_0_9 = {}
      if l_0_1[l_0_7] == nil then
        l_0_1[l_0_7] = l_0_5
        for l_0_10, l_0_11 in string.gmatch(l_0_6, "(%w+):(%w+)") do
          l_0_9[l_0_10] = l_0_11
        end
        local l_0_12 = l_0_9.TotalSizeAppend and tonumber(l_0_9.TotalSizeAppend) or 0
        if 0 < l_0_12 then
          if 16 < l_0_12 then
            l_0_4 = l_0_4 + 1
            break
          end
          local l_0_13 = l_0_9.LastOff and tonumber(l_0_9.LastOff) or 0
          local l_0_14 = l_0_9.FirstOff and tonumber(l_0_9.FirstOff) or 0
          local l_0_15 = l_0_9.NumWrites and tonumber(l_0_9.NumWrites) or 0
          local l_0_16 = l_0_9.BiggestOff and tonumber(l_0_9.BiggestOff) or 0
          local l_0_17 = l_0_9.SmallestOff and tonumber(l_0_9.SmallestOff) or 0
          local l_0_18 = l_0_9.TotalSizeWrite and tonumber(l_0_9.TotalSizeWrite) or 0
          if l_0_16 ~= 0 and l_0_14 == 0 and l_0_17 == 0 and l_0_16 == l_0_13 and l_0_13 + 1 == l_0_18 and 0 < l_0_15 and 0 < l_0_12 and l_0_12 <= 16 then
            if 10 <= l_0_3 then
              break
            elseif l_0_3 < 10 then
              l_0_9.path = l_0_7
              l_0_2[l_0_5] = l_0_9
            end
            l_0_3 = l_0_3 + 1
          end
        end
      end
    end
  end
end
local l_0_19 = {}
local l_0_20 = 0
if l_0_4 == 0 and 10 <= l_0_3 then
  for l_0_21, l_0_22 in pairs(l_0_2) do
    local l_0_23 = sigattr_tail[l_0_21].utf8p1
    local l_0_24 = sysio.GetFileSize(l_0_23)
    if l_0_24 ~= nil and 256 < l_0_24 and l_0_24 == tonumber(l_0_22.TotalSizeWrite) then
      local l_0_25 = sysio.ReadFile(l_0_23, 0, 256)
      if l_0_25 ~= nil then
        local l_0_26 = string.format("\\x%02X\\x%02X\\x%02X\\x%02X", string.byte(l_0_25, 1, 4))
        local l_0_27 = crypto.ComputeEntropy(l_0_25)
        table.insert(l_0_19, {
          FilePath = l_0_23,
          Filesize = l_0_24,
          MagicByte = l_0_26,
          Entropy = l_0_27,
          AppendedSize = tonumber(l_0_22.TotalSizeAppend),
          WriteSize = tonumber(l_0_22.TotalSizeWrite)
        })
        l_0_20 = l_0_20 + 1
      end
    end
    if 5 <= l_0_20 then
      local l_0_28 = {}
      l_0_28.gen_ransom_data = l_0_19
      local l_0_29 = safeJsonSerialize(l_0_28)
      bm.add_related_string("genfb_ransom_meta", l_0_29, bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:FileAppendBucket1:16", l_0_29)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
