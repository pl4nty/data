-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsBAtobFingerprintRedirectFlow
-- Type: 13
-- MpAttributes: //SCPT:nJsBAtob

local function l_0_0(l_1_0)
  local l_1_1 = {
    "([%a_$][%w_$]*)%s*=%s*([%a_$][%w_$]*)%s*!==?%s*['\"]%s*['\"]%s*%?%s*atob%s*%(%s*([%a_$][%w_$]*)%s*%)%s*:%s*['\"]%s*['\"]",
    
    "([%a_$][%w_$]*)%s*=%s*([%a_$][%w_$]*)%s*!==?%s*['\"]%s*['\"]%s*%?%s*window%.atob%s*%(%s*([%a_$][%w_$]*)%s*%)%s*:%s*['\"]%s*['\"]"
  }
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    for l_1_4, l_1_5, l_1_6 in string.gmatch(l_1_0, l_1_3) do
      if l_1_4 == l_1_5 and l_1_4 == l_1_6 then
        return true
      end
    end
  end
  return false
end

local function l_0_1(l_2_0)
  local l_2_1 = {
    "getscreeninfo%s*%(",
    "getuseragent%s*%(",
    "deviceorientation",
    "components%s*%.%s*fonts",
    "components%s*%.%s*timezone",
    "fingerprintjs"
  }
  local l_2_2 = 0
  for l_2_3, l_2_4 in ipairs(l_2_1) do
    if string.find(l_2_0, l_2_4) ~= nil then
      l_2_2 = l_2_2 + 1
      if 2 <= l_2_2 then
        return true
      end
    end
  end
  return false
end

local function l_0_2(l_3_0)
  local l_3_1 = {
    "window%s*%.%s*location%s*=",
    "window%s*%.%s*location%s*%.%s*href%s*=",
    "location%s*%.%s*href%s*=",
    "location%s*%.%s*replace%s*%(",
    "location%s*%.%s*assign%s*%("
  }
  for l_3_2, l_3_3 in ipairs(l_3_1) do
    if string.find(l_3_0, l_3_3) ~= nil then
      return true
    end
  end
  return false
end

local function l_0_3(l_4_0)
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = string.lower(tostring(l_4_0))
  return l_0_0(l_4_1) and l_0_1(l_4_1) and l_0_2(l_4_1)
end

if not l_0_3(headerpage) and not l_0_3(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
