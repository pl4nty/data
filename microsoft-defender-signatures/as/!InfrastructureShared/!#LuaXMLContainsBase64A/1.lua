-- Threat: !InfrastructureShared
-- Name: !#Lua:XMLContainsBase64.A
-- Type: 13
-- MpAttributes: BM_XML_FILE & AGGR:XMLSearchBase64.A

local function l_0_0(l_1_0)
  local l_1_1 = 256
  
  local l_1_2 = 0
  local l_1_3 = false
  local l_1_4 = false
  for l_1_5 = 1, #l_1_0 do
    local l_1_6 = l_1_0:byte(l_1_5)
    if 65 <= l_1_6 and l_1_6 <= 90 or 97 <= l_1_6 and l_1_6 <= 122 or l_1_6 == 61 then
      l_1_2 = l_1_2 + 1
    elseif 48 <= l_1_6 and l_1_6 <= 57 then
      l_1_2 = l_1_2 + 1
      l_1_3 = true
    elseif l_1_6 == 43 or l_1_6 == 47 then
      l_1_2 = l_1_2 + 1
      l_1_4 = true
    else
      l_1_2, l_1_3, l_1_4 = 0, false, false
    end
    if l_1_1 <= l_1_2 and l_1_3 and l_1_4 then
      return true
    end
  end
  return false
end

local l_0_1 = tostring(headerpage)
local l_0_2 = tostring(footerpage)
local l_0_3 = false
if l_0_0(l_0_1) then
  mp.set_mpattribute("Lua:XMLContainsBase64.A!Header")
  l_0_3 = true
end
if l_0_0(l_0_2) then
  mp.set_mpattribute("Lua:XMLContainsBase64.A!Footer")
  l_0_3 = true
end
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
