-- Threat: !InfrastructureShared
-- Name: 429b311876ca3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = false
local l_0_1
if this_sigattrlog[13].matched then
  l_0_1 = this_sigattrlog[13].utf8p2
  l_0_0 = true
end
if this_sigattrlog[14].matched then
  l_0_1 = this_sigattrlog[14].utf8p2
  for l_0_2, l_0_3 in string.gmatch(l_0_1, "RPort2_10=(%d+)-(%d+)|") do
    if tonumber(l_0_2) <= 443 and tonumber(l_0_3) >= 443 then
      l_0_0 = true
    end
  end
end
local l_0_4 = "(app|svc|RA42|RA62|RA6|RA4|LA6|LA4|lport|LPort2_10|LPort2_20)="
local l_0_5, l_0_6 = MpCommon.StringRegExpSearch(l_0_4, l_0_1)
if l_0_0 and not l_0_5 then
  local l_0_7, l_0_8 = pcall(reportBmInfo)
  if not l_0_7 and l_0_8 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_8), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
