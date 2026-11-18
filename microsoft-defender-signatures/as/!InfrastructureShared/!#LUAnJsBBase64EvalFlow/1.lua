-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsBBase64EvalFlow
-- Type: 13
-- MpAttributes: //SCPT:nJsBAtob & SCPT:Trojan:JS/JSCoinMiner.EvalOnly

local l_0_0 = 80
local l_0_1 = 3072

local function l_0_2(l_1_0)
  local l_1_1 = string.len(l_1_0)
  return l_1_1 >= l_0_0 and l_1_1 <= l_0_1
end

local function l_0_3(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_2_0[l_2_1]
  if l_2_3 == nil or l_2_2 < l_2_3 then
    l_2_0[l_2_1] = l_2_2
  end
end

local function l_0_4(l_3_0)
  local l_3_1 = {
    "eval%s*%(%s*atob%s*%(%s*['\"]([%w%+/%=]+)['\"]%s*%)%s*%)",
    "eval%s*%(%s*window%.atob%s*%(%s*['\"]([%w%+/%=]+)['\"]%s*%)%s*%)"
  }
  for l_3_2, l_3_3 in ipairs(l_3_1) do
    for l_3_4 in string.gmatch(l_3_0, l_3_3) do
      if l_0_2(l_3_4) then
        return true
      end
    end
  end
  return false
end

local function l_0_5(l_4_0)
  local l_4_1 = {}
  local l_4_2 = {}
  local l_4_3 = 1
  while true do
    local l_4_4, l_4_5, l_4_6, l_4_7 = string.find(l_4_0, "([%a_$][%w_$]*)%s*=%s*['\"]([%w%+/%=]+)['\"]", l_4_3)
    if l_4_4 == nil then
      break
    end
    if l_0_2(l_4_7) then
      l_0_3(l_4_1, l_4_6, l_4_5)
    end
    l_4_3 = l_4_5 + 1
  end
  local l_4_8 = {
    "([%a_$][%w_$]*)%s*=%s*atob%s*%(%s*['\"]([%w%+/%=]+)['\"]%s*%)",
    "([%a_$][%w_$]*)%s*=%s*window%.atob%s*%(%s*['\"]([%w%+/%=]+)['\"]%s*%)"
  }
  for l_4_9, l_4_10 in ipairs(l_4_8) do
    l_4_3 = 1
    while true do
      local l_4_11, l_4_12, l_4_13, l_4_14 = string.find(l_4_0, l_4_10, l_4_3)
      if l_4_11 == nil then
        break
      end
      if l_0_2(l_4_14) then
        l_0_3(l_4_2, l_4_13, l_4_12)
      end
      l_4_3 = l_4_12 + 1
    end
  end
  local l_4_15 = {
    "([%a_$][%w_$]*)%s*=%s*atob%s*%(%s*([%a_$][%w_$]*)%s*%)",
    "([%a_$][%w_$]*)%s*=%s*window%.atob%s*%(%s*([%a_$][%w_$]*)%s*%)"
  }
  for l_4_16, l_4_17 in ipairs(l_4_15) do
    l_4_3 = 1
    while true do
      local l_4_18, l_4_19, l_4_20, l_4_21 = string.find(l_4_0, l_4_17, l_4_3)
      if l_4_18 == nil then
        break
      end
      local l_4_22 = l_4_1[l_4_21]
      if l_4_22 ~= nil and l_4_18 > l_4_22 then
        l_0_3(l_4_2, l_4_20, l_4_19)
      end
      l_4_3 = l_4_19 + 1
    end
  end
  l_4_3 = 1
  while true do
    local l_4_23, l_4_24, l_4_25 = string.find(l_4_0, "eval%s*%(%s*([%a_$][%w_$]*)%s*%)", l_4_3)
    if l_4_23 == nil then
      break
    end
    local l_4_26 = l_4_2[l_4_25]
    if l_4_26 ~= nil and l_4_23 > l_4_26 then
      return true
    end
    l_4_3 = l_4_24 + 1
  end
  return false
end

local function l_0_6(l_5_0)
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = string.lower(tostring(l_5_0))
  return l_0_4(l_5_1) or l_0_5(l_5_1)
end

if not l_0_6(headerpage) and not l_0_6(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
