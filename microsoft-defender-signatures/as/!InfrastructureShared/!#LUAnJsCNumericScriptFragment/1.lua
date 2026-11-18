-- Threat: !InfrastructureShared
-- Name: !#//LUA:nJsCNumericScriptFragment
-- Type: 13
-- MpAttributes: //SCPT:nJsCNumericScriptFragment

local l_0_0 = {
  118,
  61,
  119,
  46
}
local l_0_1 = 12

local function l_0_2(l_1_0)
  if l_1_0 == nil then
    return false
  end
  local l_1_1 = string.lower(tostring(l_1_0))
  local l_1_2 = string.gsub(l_1_1, "%s+", "")
  for l_1_3 in string.gmatch(l_1_2, "string%.fromcharcode%(([%d,]+)%)") do
    local l_1_4 = 0
    local l_1_5 = true
    for l_1_6 in string.gmatch(l_1_3, "%d+") do
      l_1_4 = l_1_4 + 1
      if l_1_4 <= #l_0_0 and tonumber(l_1_6) ~= l_0_0[l_1_4] then
        l_1_5 = false
        break
      end
    end
    if l_1_5 and l_1_4 >= l_0_1 then
      return true
    end
  end
  return false
end

if not l_0_2(headerpage) and not l_0_2(footerpage) then
  return mp.CLEAN
end
return mp.INFECTED
