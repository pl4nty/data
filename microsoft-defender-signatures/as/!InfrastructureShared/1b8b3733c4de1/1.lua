-- Threat: !InfrastructureShared
-- Name: 1b8b3733c4de1
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 4
local l_0_3 = 0
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 then
  local l_0_4 = safeJsonDeserialize(this_sigattrlog[13].utf8p2)
  local l_0_5 = {}
  if tonumber(l_0_4.append_size) == 92 then
    for l_0_6 = 1, l_0_0 do
      local l_0_7 = sigattr_tail[l_0_6].utf8p2
      if sigattr_tail[l_0_6].attribute == 16385 and string.len(sigattr_tail[l_0_6].utf8p1) > 5 and sigattr_tail[l_0_6].utf8p1:byte(1) ~= 37 then
        local l_0_8 = sigattr_tail[l_0_6].utf8p1:lower()
        local l_0_9 = {}
        if l_0_1[l_0_8] == nil then
          l_0_1[l_0_8] = l_0_6
          for l_0_10, l_0_11 in string.gmatch(l_0_7, "(%w+):(%w+)") do
            l_0_9[l_0_10] = l_0_11
          end
          local l_0_12 = l_0_9.LastOff and tonumber(l_0_9.LastOff) or 0
          local l_0_13 = l_0_9.FirstOff and tonumber(l_0_9.FirstOff) or 0
          local l_0_14 = l_0_9.NumWrites and tonumber(l_0_9.NumWrites) or 0
          local l_0_15 = l_0_9.BiggestOff and tonumber(l_0_9.BiggestOff) or 0
          local l_0_16 = l_0_9.SmallestOff and tonumber(l_0_9.SmallestOff) or 0
          if (l_0_13 == l_0_12 + 1 or l_0_13 == l_0_12 + 2) and l_0_16 == 0 and (l_0_15 == l_0_12 + 92 or l_0_15 == l_0_12 + 93) and l_0_14 < 10 and 256 < l_0_15 then
            local l_0_17 = sysio.ReadFile(sigattr_tail[l_0_6].utf8p1, 0, 256)
            if l_0_17 ~= nil then
              local l_0_18 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_17, 1, 4))
              local l_0_19 = crypto.ComputeEntropy(l_0_17)
              if 7 <= l_0_19 then
                table.insert(l_0_5, {
                  path = sigattr_tail[l_0_6].utf8p1,
                  magic = l_0_18,
                  entropy = l_0_19
                })
                l_0_3 = l_0_3 + 1
                if l_0_2 <= l_0_3 then
                  local l_0_20 = {}
                  l_0_20.append_size = l_0_4.append_size
                  l_0_20.file_paths = l_0_5
                  bm.add_related_string("genfa_lockbit4_meta", safeJsonSerialize(l_0_20), bm.RelatedStringBMReport)
                  sms_untrusted_process()
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
return mp.CLEAN
