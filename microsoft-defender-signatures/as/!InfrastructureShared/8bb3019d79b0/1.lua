-- Threat: !InfrastructureShared
-- Name: 8bb3019d79b0
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].ppid
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_2 == nil or l_0_0 == nil or l_0_1 == nil or l_0_0 ~= l_0_1 then
  return mp.CLEAN
end
local l_0_3 = bm.get_process_notifications(l_0_2)
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if l_0_5.tag == 3 and l_0_5.rawutf8p1 == l_0_0 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
