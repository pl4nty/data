-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\429b311876ca3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = nil
if (this_sigattrlog[13]).matched then
  l_0_1 = (this_sigattrlog[13]).utf8p2
  l_0_0 = true
end
if (this_sigattrlog[14]).matched then
  l_0_1 = (this_sigattrlog[14]).utf8p2
  for l_0_5,l_0_6 in (string.gmatch)(l_0_1, "RPort2_10=(%d+)-(%d+)|") do
    if tonumber(l_0_5) <= 443 and tonumber(l_0_6) >= 443 then
      l_0_0 = true
    end
  end
end
do
  local l_0_7 = "(app|svc|RA42|RA62|RA6|RA4|LA6|LA4|lport|LPort2_10|LPort2_20)="
  local l_0_8, l_0_9 = (MpCommon.StringRegExpSearch)(l_0_7, l_0_1)
  do
    if l_0_0 and not l_0_8 then
      local l_0_10, l_0_11 = pcall(reportBmInfo)
      if not l_0_10 and l_0_11 then
        (bm.add_related_string)("bmInfoFailReason", tostring(l_0_11), bm.RelatedStringBMReport)
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

