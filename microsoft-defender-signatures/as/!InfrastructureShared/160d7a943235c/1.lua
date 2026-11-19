-- Threat: !InfrastructureShared
-- Name: 160d7a943235c
-- Type: 21

local l_0_0 = mp.hstr_full_log()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  l_0_0[1],
  l_0_0[2],
  l_0_0[3],
  l_0_0[4],
  l_0_0[5],
  l_0_0[6],
  l_0_0[7],
  l_0_0[8],
  l_0_0[9],
  l_0_0[10],
  l_0_0[11],
  l_0_0[12],
  l_0_0[13],
  l_0_0[14],
  l_0_0[15]
}
for l_0_2 = 1, 15 do
  local l_0_3 = l_0_1[l_0_2]
  if l_0_3 and l_0_3.matched then
    return mp.INFECTED
  end
end
local l_0_4 = l_0_0[16]
if not l_0_4 or not l_0_4.matched then
  return mp.CLEAN
end
local l_0_5 = l_0_0[17]
if not l_0_5 or not l_0_5.matched then
  return mp.CLEAN
end

local function l_0_6(l_1_0, l_1_1)
  if type(l_1_0) ~= "string" or #l_1_0 == 0 or 64 < #l_1_0 then
    return false
  end
  if string.match(l_1_0, "^[*?]+$") then
    return false
  end
  l_1_0 = string.lower(l_1_0)
  if l_1_0 == l_1_1 then
    return true
  end
  if not string.find(l_1_0, "*", 1, true) and not string.find(l_1_0, "?", 1, true) then
    return false
  end
  local l_1_2, l_1_3 = string.gsub(l_1_0, "%*+", "*")
  if 8 < l_1_3 then
    return false
  end
  local l_1_4 = string.gsub(l_1_2, "([%%%^%$%(%)%.%[%]%+%-])", "%%%1")
  l_1_4 = string.gsub(l_1_4, "%*", string.char(46, 42))
  l_1_4 = string.gsub(l_1_4, "%?", ".")
  l_1_4 = "^" .. l_1_4 .. "$"
  return string.match(l_1_1, l_1_4) ~= nil
end

local function l_0_7(l_2_0, l_2_1)
  local l_2_2 = string.sub(l_2_0, l_2_1, l_2_1 + 128)
  local l_2_3, l_2_4
  local l_2_5 = 0
  if string.sub(l_2_2, 1, 1) == "\"" then
    local l_2_6 = string.find(l_2_2, "\"", 2, true)
    if not l_2_6 then
      return nil
    end
    l_2_3 = string.sub(l_2_2, 2, l_2_6 - 1)
    l_2_4 = l_2_6 + 1
  else
    l_2_3 = string.match(l_2_2, "^([^%s,;=&|<>()\"']+)")
    if not l_2_3 then
      return nil
    end
    l_2_4 = #l_2_3 + 1
    l_2_3, l_2_5 = string.gsub(l_2_3, "%^([a-z])", "%1")
  end
  local l_2_7 = string.sub(l_2_0, l_2_1 + l_2_4 - 1, l_2_1 + l_2_4 - 1)
  if l_2_7 ~= "" and not string.find(l_2_7, "[%s,;=&|<>()']") then
    return nil
  end
  if #l_2_3 == 0 or 64 < #l_2_3 then
    return nil
  end
  local l_2_9 = 0 < l_2_5 or string.find(l_2_3, "*", 1, true) ~= nil or string.find(l_2_3, "?", 1, true) ~= nil
  return l_2_3, l_2_9
end

local l_0_8 = mp.GetScannedPPID()
if not l_0_8 or l_0_8 == "" then
  return mp.CLEAN
end
local l_0_9 = mp.GetProcessCommandLine(l_0_8)
if type(l_0_9) ~= "string" or #l_0_9 == 0 or 32767 < #l_0_9 then
  return mp.CLEAN
end
l_0_9 = " " .. string.lower(l_0_9)
local l_0_10 = 1
local l_0_11 = false
while l_0_10 <= #l_0_9 do
  local l_0_12, l_0_13 = string.find(l_0_9, "[%s&|()'\"]where[ \t,;=]+", l_0_10)
  if not l_0_13 then
    break
  end
  l_0_10 = l_0_13
  local l_0_14, l_0_15 = l_0_7(l_0_9, l_0_13 + 1)
  if l_0_14 then
    for l_0_16, l_0_17 in ipairs({
      "curl",
      "powershell",
      "finger"
    }) do
      if l_0_6(l_0_14, l_0_17) or l_0_6(l_0_14, l_0_17 .. ".exe") then
        if l_0_15 then
          return mp.INFECTED
        end
        l_0_11 = true
        break
      end
    end
  end
end
if l_0_11 then
  return mp.CLEAN
end
return mp.CLEAN
