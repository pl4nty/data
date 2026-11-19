-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsBXhrResponseEvalFlow
-- Type: 13
-- MpAttributes: //SCPT:nJsBXhrResponseEval

local function l_0_0(l_1_0)
  return string.gsub(l_1_0, "(%W)", "%%%1")
end

local function l_0_1(l_2_0, l_2_1, l_2_2, l_2_3)
  local l_2_4 = l_0_0(l_2_1)
  local l_2_5 = {
    l_2_4 .. "%s*%.%s*" .. l_2_2 .. "%s*%(",
    l_2_4 .. "%s*%[%s*['\"]" .. l_2_2 .. "['\"]%s*%]%s*%("
  }
  for l_2_6, l_2_7 in ipairs(l_2_5) do
    if string.find(l_2_0, l_2_7, l_2_3) ~= nil then
      return true
    end
  end
  return false
end

local function l_0_2(l_3_0, l_3_1, l_3_2)
  local l_3_3 = l_0_0(l_3_1)
  local l_3_4 = {
    l_3_3 .. "%s*%.%s*responsetext",
    l_3_3 .. "%s*%[%s*['\"]responsetext['\"]%s*%]"
  }
  for l_3_5, l_3_6 in ipairs(l_3_4) do
    local l_3_7 = {
      "eval%s*%(%s*" .. l_3_6 .. "%s*%)",
      "window%.eval%s*%(%s*" .. l_3_6 .. "%s*%)"
    }
    for l_3_8, l_3_9 in ipairs(l_3_7) do
      if string.find(l_3_0, l_3_9, l_3_2) ~= nil then
        return true
      end
    end
  end
  return false
end

local function l_0_3(l_4_0, l_4_1, l_4_2)
  local l_4_3 = l_0_0(l_4_1)
  local l_4_4 = {
    "([%a_$][%w_$]*)%s*=%s*" .. l_4_3 .. "%s*%.%s*responsetext",
    "([%a_$][%w_$]*)%s*=%s*" .. l_4_3 .. "%s*%[%s*['\"]responsetext['\"]%s*%]"
  }
  for l_4_5, l_4_6 in ipairs(l_4_4) do
    local l_4_7, l_4_8, l_4_9 = string.find(l_4_0, l_4_6, l_4_2)
    while l_4_7 ~= nil do
      local l_4_10 = l_0_0(l_4_9)
      local l_4_11 = {
        "eval%s*%(%s*" .. l_4_10 .. "%s*%)",
        "window%.eval%s*%(%s*" .. l_4_10 .. "%s*%)"
      }
      for l_4_12, l_4_13 in ipairs(l_4_11) do
        if string.find(l_4_0, l_4_13, l_4_8 + 1) ~= nil then
          return true
        end
      end
      l_4_7, l_4_8, l_4_9 = string.find(l_4_0, l_4_6, l_4_8 + 1)
    end
  end
  return false
end

local function l_0_4(l_5_0)
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = string.lower(tostring(l_5_0))
  local l_5_2 = {
    "([%a_$][%w_$]*)%s*=%s*new%s+xmlhttprequest%s*%(",
    "([%a_$][%w_$]*)%s*=%s*new%s+window%.xmlhttprequest%s*%("
  }
  for l_5_3, l_5_4 in ipairs(l_5_2) do
    local l_5_5, l_5_6, l_5_7 = string.find(l_5_1, l_5_4, 1)
    while l_5_5 ~= nil do
      local l_5_8 = l_0_1(l_5_1, l_5_7, "open", l_5_6 + 1) and l_0_1(l_5_1, l_5_7, "send", l_5_6 + 1)
      if l_5_8 and (l_0_2(l_5_1, l_5_7, l_5_6 + 1) or l_0_3(l_5_1, l_5_7, l_5_6 + 1)) then
        return true
      end
      l_5_5, l_5_6, l_5_7 = string.find(l_5_1, l_5_4, l_5_6 + 1)
    end
  end
  return false
end

if not l_0_4(headerpage) and not l_0_4(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
