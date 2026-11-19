-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/PolinRider.SC
-- Type: 13
-- MpAttributes: BRUTE:PaddedGlobalScript.A

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  local r1_0 = string.match(p1_0, "return%s+([%a_$][%w_$]*)%s*%.%s*join%s*%(%s*(['\"])%2%s*%)")
  if r1_0 == nil then
    return false
  end
  local r1_1 = string.lower(string.gsub(p1_0, "%s+", ""))
  local r1_2 = string.find(r1_1, ".charat(", 1, true)
  if r1_2 == nil then
    return false
  end
  r1_1 = string.sub(r1_1, r1_2)
  if string.find(r1_1,
    "^%.charat%([%a_$][%w_$]*%);?};for%(var([%a_$][%w_$]*)=0;%1<[%a_$][%w_$]*;%1%+%+%){var") then
    local r1_3, r1_4, r1_5, r1_6 = string.find(r1_1,
      "var([%a_$][%w_$]*)=([%a_$][%w_$]*)%[([%a_$][%w_$]*)%];%2%[%3%]=%2%[([%a_$][%w_$]*)%];%2%[%4%]=%1;")
    if r1_3 ~= nil and string.lower(r1_0) == r1_6 then
      local r1_7, r1_8 = string.find(r1_1, "};return" .. r1_6 .. ".join(", r1_4 + 1, true)
      if r1_7 ~= nil and not (r1_7 - r1_4 > 128) then
        local r1_9 = string.sub(r1_1, r1_4 + 1, r1_7 - 1)
        if string.find(r1_9, "^[%a_$][%w_$]*=%([%a_$][%w_$]*%+[%a_$][%w_$]*%)%%%d+;$") then
          local r1_10 = string.sub(r1_1, r1_8 + 1, r1_8 + 3)
          return r1_10 == "'')" or r1_10 == '"")'
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

local r0_1 = mp.getfilesize()
local r0_2 = 512
if r0_1 ~= nil and not (r0_1 <= r0_2) and not (r0_1 > 8388608) then
  local r0_3 = r0_2
  for r0_4 = 1, 64 do
    if r0_1 - 6 < r0_3 then
      return mp.CLEAN
    end
    local r0_5 = r0_1 - r0_3
    mp.readprotection(false)
    local r0_6, r0_7 = pcall(mp.BMSearchFile, r0_3, r0_5, "global\144\000")
    mp.readprotection(true)
    if not r0_6 then
      mp.set_mpattribute("Lua:PaddedGlobalScriptSearchFailed")
      return mp.CLEAN
    end
    if r0_7 == nil or r0_7 < 0 or r0_5 - 6 < r0_7 then
      return mp.CLEAN
    end
    local r0_8 = r0_3 + r0_7
    local r0_9 = r0_8 - r0_2
    local r0_10 = r0_1 - r0_9
    if r0_2 + 2048 < r0_10 then
      r0_10 = r0_2 + 2048
    end
    mp.readprotection(false)
    local r0_11 = mp.readfile(r0_9, r0_10)
    mp.readprotection(true)
    if r0_11 == nil then
      mp.set_mpattribute("Lua:PaddedGlobalScriptReadFailed")
      return mp.CLEAN
    end
    local r0_12 = tostring(r0_11)
    if #r0_12 ~= r0_10 then
      mp.set_mpattribute("Lua:PaddedGlobalScriptReadFailed")
      return mp.CLEAN
    end
    local r0_13 = string.sub(r0_12, 1, r0_2)
    if not string.find(r0_13, "[^ \t\r\n]") then
      local r0_14 = string.sub(r0_12, r0_2 + 1)
      local r0_15 = string.find(r0_14, "^global%s*[%[%.]")
      local r0_16 = string.sub(r0_14, 1, 512)
      local r0_17 = string.find(r0_16, "global%s*%.%s*[%a_$][%w_$]*%s*=%s*require%s*;")
        or string.find(r0_16, "global%s*%[%s*(['\"])[%w_$]+%1%s*%]%s*=%s*require%s*;")
      if r0_15 and r0_17 and r0_0(r0_14) then
        return mp.INFECTED
      end
    end
    r0_3 = r0_8 + 6
  end
  return mp.CLEAN
end
return mp.CLEAN
