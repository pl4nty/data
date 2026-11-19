-- Threat: !InfrastructureShared
-- Name: 292983711b0a
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 32
local l_0_2 = 16
local l_0_3 = ""
if l_0_0.is_header then
  l_0_3 = tostring(headerpage):sub(l_0_1, l_0_1 + l_0_2)
else
  l_0_3 = tostring(footerpage):sub(l_0_1, l_0_1 + l_0_2)
end
if l_0_3 ~= nil then
  l_0_3 = l_0_3:lower()
  if string.find(l_0_3, "calc", 1, true) or string.find(l_0_3, "reg", 1, true) or string.find(l_0_3, "mshta", 1, true) or string.find(l_0_3, "powershell", 1, true) or string.find(l_0_3, "bitsadmin", 1, true) or string.find(l_0_3, "schtasks", 1, true) or string.find(l_0_3, "rundll", 1, true) or string.find(l_0_3, "wscript", 1, true) or string.find(l_0_3, "cscript", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
