-- Threat: !InfrastructureShared
-- Name: 1929d0a80c81
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
if r0_0 < 409600 then
  return mp.CLEAN
end
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0))
if r0_1 and #r0_1 ~= 0 then
  mp.readprotection(true)

  local function r0_2(p1_0, p1_1)
    local r1_0, r1_1 = 0, 1
    while true do
      local r1_2, r1_3 = string.find(p1_0, p1_1, r1_1)
      if not r1_2 then
        break
      end
      r1_0 = r1_0 + 1
      r1_1 = r1_3 + 1
    end
    return r1_0
  end

  local function r0_3(p2_0)
    local r2_0 = r0_2(p2_0, "%{%}%+%[%]")
    local r2_1 = r0_2(p2_0, "%+%{%}%+%[%]")
    return r2_0 + r2_1, r2_0, r2_1
  end

  local function r0_4(p3_0)
    local r3_0, r3_1 = string.gsub(p3_0, "[%{%}%[%]%(%)%!%+]", "")
    return r3_1
  end

  local r0_5 = r0_3(r0_1)
  if r0_5 < 3 then
    return mp.CLEAN
  end
  if r0_4(r0_1) - r0_5 * 5 >= 10 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
