-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsECharacterDecodeEvalFlow
-- Type: 13
-- MpAttributes: SCPT:JsMethodFunc_charcodeat

local function l_0_0(l_1_0)
  return string.gsub(l_1_0, "([^%w])", "%%%1")
end

local function l_0_1(l_2_0)
  if l_2_0 == nil then
    return false
  end
  local l_2_1 = string.lower(tostring(l_2_0))
  local l_2_2 = string.gsub(l_2_1, "%s+", "")
  for l_2_3 in string.gmatch(l_2_2, "eval%(([%a_$][%w_$]*)%)") do
    local l_2_4 = l_0_0(l_2_3)
    local l_2_5 = "eval%(" .. l_2_4 .. "%)"
    local l_2_6 = 1
    while true do
      local l_2_7 = string.find(l_2_2, l_2_5, l_2_6)
      if l_2_7 == nil then
        break
      end
      local l_2_8 = string.sub(l_2_2, 1, l_2_7 - 1)
      local l_2_9 = l_2_4 .. "%+=string%.fromcharcode%("
      local l_2_10 = l_2_4 .. "%+=fromcharcode%("
      local l_2_11 = l_2_4 .. "=" .. l_2_4 .. "%+string%.fromcharcode%("
      local l_2_12 = l_2_4 .. "=" .. l_2_4 .. "%+fromcharcode%("
      local l_2_14 = string.find(l_2_8, l_2_9) ~= nil or string.find(l_2_8, l_2_10) ~= nil or string.find(l_2_8, l_2_11) ~= nil or string.find(l_2_8, l_2_12) ~= nil
      if l_2_14 and string.find(l_2_8, "charcodeat%(") ~= nil then
        return true
      end
      l_2_6 = l_2_7 + 1
    end
  end
  return false
end

if not l_0_1(headerpage) and not l_0_1(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
