-- Threat: !InfrastructureShared
-- Name: aab30a01ffb7
-- Type: 21
-- Includes: LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.SIGATTR_LOG_SZ
local r0_1 = 0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local r0_2 = {}
  for r0_3 = 1, r0_0 do
    if sigattr_tail[r0_3].attribute == 16387 and sigattr_tail[r0_3].utf8p1 then
      r0_2[sigattr_tail[r0_3].utf8p1:lower()] = r0_3
      r0_1 = r0_1 + 1
    end
  end
  local r0_4 = {}
  if r0_1 >= 5 and this_sigattrlog[1].utf8p2 then
    local r0_5 = {}
    local r0_6 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
    for r0_7, r0_8 in pairs(r0_6.file_list) do
      for r0_9, r0_10 in pairs(r0_2) do
        local r0_11 = #r0_8
        if #r0_9 < r0_11 and r0_8:find(r0_9, 1, true) == 1 and r0_8:byte(#r0_9 + 1) ~= 58 then
          local r0_12 = string.sub(r0_8, #r0_9 + 1)
          if r0_12:find("\\", 1, true) == nil then
            if r0_4[r0_12] == nil then
              r0_4[r0_12] = { r0_10 }
            else
              table.insert(r0_4[r0_12], r0_10)
            end
            if #r0_4[r0_12] >= 3 then
              for r0_13, r0_14 in pairs(r0_4[r0_12]) do
                table.insert(r0_5, sigattr_tail[r0_14].utf8p1)
              end
              local r0_15 = { appended_ext = r0_12, encrypted_file_meta = r0_5 }
              bm.trigger_sig("GenericRansomware:Type4.2", safeJsonSerialize(r0_15))
              return mp.INFECTED
            end
            break
          end
          break
        end
      end
    end
  end
end
return mp.CLEAN
