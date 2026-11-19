-- Threat: \xac!JsonSerializeExceedLimit.A
-- Type: 12

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.crc32(-1, "019ca915-e643-40e2-9b48-9843fd8f9b17", 1, 36)
local r0_1 = mp.crc32(-1, headerpage, 1, 36)
if r0_1 == r0_0 then
  local function r0_2(p1_0, p1_1)
    local function r1_0(p2_0)
      if p2_0 == 1 then
        return { value = "value1" }
      end
      local r2_0 = p2_0 - 1
      local r2_1, r2_2 = pcall(r1_0, r2_0)
      return { key1 = r2_2 }
    end

    local r1_1 = {}
    for r1_2 = 1, p1_0 do
      local r1_3 = "key" .. r1_2
      local r1_4, r1_5 = pcall(r1_0, p1_1)
      r1_1[r1_3] = r1_5
      _ = r1_4
    end
    return r1_1
  end

  local r0_3, r0_4 = pcall(r0_2, 520, 1)
  if r0_3 then
    local r0_5 = pcall(MpCommon.JsonSerialize, r0_4)
    if r0_5 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
