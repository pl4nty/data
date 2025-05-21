-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3b8_584.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_4 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_5 = sigattr_tail[l_0_4]
  if l_0_5.attribute == 16402 and l_0_5.utf8p2 then
    local l_0_6, l_0_7, l_0_8 = (string.match)(l_0_5.utf8p2, "DestIp=([%d%.]+);DestPort=(%d+);.+;Uri=(.-);")
    if l_0_6 and l_0_7 then
      local l_0_9 = (string.format)("ip:%s;port:%s:uri:%s", l_0_6, l_0_7, l_0_8)
      if not l_0_0[l_0_9] then
        l_0_0[l_0_9] = true
        ;
        (bm.add_related_string)("c7de7b1b", l_0_9, bm.RelatedStringBMReport)
      end
    end
  end
end
return mp.INFECTED

