-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsDReverseUrlFlow
-- Type: 13
-- MpAttributes: SCPT:Trojan:JS/Redirector.ABA2

local function l_0_0(l_1_0)
  return string.gsub(l_1_0, "([^%w])", "%%%1")
end

local function l_0_1(l_2_0)
  local l_2_1 = "function([%a_$][%w_$]*)%(([%a_$][%w_$]*)%)%{" .. "return([%a_$][%w_$]*)%.split%(['\"]['\"]%)" .. "%.reverse%(%)%.join%(['\"]['\"]%)"
  for l_2_2, l_2_3, l_2_4 in string.gmatch(l_2_0, l_2_1) do
    if l_2_3 == l_2_4 then
      return l_2_2
    end
  end
  return nil
end

local function l_0_2(l_3_0, l_3_1)
  local l_3_2 = l_0_0(l_3_1) .. "%(['\"]([^'\"]-)['\"]"
  for l_3_3 in string.gmatch(l_3_0, l_3_2) do
    if string.find(l_3_3, "//:ptth", 1, true) ~= nil or string.find(l_3_3, "//:sptth", 1, true) ~= nil then
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
  local l_4_2 = string.gsub(l_4_1, "%s+", "")
  local l_4_3 = l_0_1(l_4_2)
  if l_4_3 == nil then
    return false
  end
  return l_0_2(l_4_2, l_4_3)
end

if not l_0_3(headerpage) and not l_0_3(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
