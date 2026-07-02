-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b37c2ffb02\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 and (this_sigattrlog[1]).utf8p2 then
  l_0_0 = tostring((this_sigattrlog[1]).utf8p1)
  l_0_1 = tostring((this_sigattrlog[1]).utf8p2)
end
if not l_0_1 then
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = safeJsonDeserialize(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2.agent_name = l_0_0
;
(bm.set_detection_string)(safeJsonSerialize(l_0_2))
return mp.INFECTED

