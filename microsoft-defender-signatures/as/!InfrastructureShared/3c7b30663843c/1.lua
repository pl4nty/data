-- Threat: !InfrastructureShared
-- Name: 3c7b30663843c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = 20
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = {
  [".jslog"] = true,
  [".rba"] = true,
  [".kpf"] = true,
  [".rsnd"] = true,
  [".mcache"] = true,
  [".plg"] = true,
  [".bix"] = true
}
for l_0_8 = 1, l_0_1 do
  if sigattr_tail[l_0_8].attribute == 16384 and sigattr_tail[l_0_8].utf8p1:byte(1) ~= 37 and sigattr_tail[l_0_8].utf8p1 then
    local l_0_9 = sigattr_tail[l_0_8].utf8p1:lower()
    if l_0_3[l_0_9] == nil then
      l_0_3[l_0_9] = l_0_8
      l_0_6 = l_0_6 + 1
    end
  end
end
if 10 < l_0_6 then
  for l_0_10 = 1, l_0_1 do
    if sigattr_tail[l_0_10].attribute == 16389 and sigattr_tail[l_0_10].utf8p2 == "ATTR_d463ed8a" and not isnull(sigattr_tail[l_0_10].utf8p1) then
      local l_0_11 = sigattr_tail[l_0_10].utf8p1:lower()
      if l_0_4[l_0_11] == nil and l_0_3[l_0_11] ~= nil then
        l_0_4[l_0_11] = l_0_10
        local l_0_12 = l_0_11:match("%.[^%.]+$")
        if l_0_12 and mp.GetExtensionClass(l_0_12) == 0 and not l_0_7[l_0_12] then
          if l_0_5[l_0_12] ~= nil then
            table.insert(l_0_5[l_0_12], l_0_10)
          else
            l_0_5[l_0_12] = {l_0_10}
          end
          if 10 <= #l_0_5[l_0_12] then
            local l_0_13 = {}
            local l_0_14 = 0
            for l_0_15, l_0_16 in pairs(l_0_5[l_0_12]) do
              l_0_11 = sigattr_tail[l_0_16].utf8p1:lower()
              local l_0_17 = l_0_3[l_0_11]
              local l_0_18 = {}
              for l_0_19, l_0_20 in string.gmatch(sigattr_tail[l_0_17].utf8p2, "(%w+):(%w+)") do
                l_0_18[l_0_19] = l_0_20
              end
              local l_0_21 = -1
              if l_0_18.FSize and tonumber(l_0_18.FSize) then
                l_0_21 = tonumber(l_0_18.FSize)
              else
                l_0_21 = sysio.GetFileSize(l_0_11)
              end
              if l_0_21 ~= nil and 256 < l_0_21 then
                local l_0_22 = ""
                local l_0_23 = 0
                local l_0_24 = sysio.ReadFile(l_0_11, 0, 256)
                if l_0_24 and not isnull(l_0_24) then
                  l_0_22 = string.format("\\x%02X\\x%02X", string.byte(l_0_24, 1, 2))
                  l_0_23 = crypto.ComputeEntropy(l_0_24)
                end
                if 7 <= l_0_23 then
                  l_0_13[l_0_22] = 1
                  local l_0_25 = {
                    path = l_0_11,
                    magic = l_0_22,
                    enc_filesize = l_0_21,
                    entropy = l_0_23
                  }
                  table.insert(l_0_2, l_0_25)
                  l_0_14 = l_0_14 + 1
                  if 5 < l_0_14 then
                    local l_0_26 = 0
                    for l_0_27 in pairs(l_0_13) do
                      l_0_26 = l_0_26 + 1
                    end
                    if 1 < l_0_26 then
                      local l_0_28 = {
                        appended_ext = l_0_12,
                        isMagicMismatch = true,
                        file_list = l_0_2
                      }
                      bm.trigger_sig("GenericRansomware:UnknownFileMeta", safeJsonSerialize(l_0_28))
                      bm.add_related_string("genda_create_ransom_meta", safeJsonSerialize(l_0_28), bm.RelatedStringBMReport)
                      return mp.INFECTED
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if l_0_0 < l_0_6 then
    bm.trigger_sig("Exclude", "NoRansomCreateFile")
  end
end
return mp.CLEAN
