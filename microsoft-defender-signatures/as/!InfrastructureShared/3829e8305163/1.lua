-- Threat: !InfrastructureShared
-- Name: 3829e8305163
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
l_0_1 = string.gsub(l_0_1, "%z", "")
l_0_1 = string.gsub(l_0_1, " ", "")
l_0_1 = string.gsub(l_0_1, "`", "")
if string.find(l_0_1, "proxy", 1, true) and string.find(l_0_1, "::", 1, true) and string.find(l_0_1, "defaultnetworkcredentials", 1, true) then
  local l_0_2 = string.lower(mp.getfilename())
  if string.find(l_0_2, "->%(%w+%)") or string.find(l_0_2, "->%[%w+%]") then
    mp.set_mpattribute("SCRIPT:Packed")
  end
  return mp.INFECTED
end
return mp.CLEAN
