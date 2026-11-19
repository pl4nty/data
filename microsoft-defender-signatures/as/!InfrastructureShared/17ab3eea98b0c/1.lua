-- Threat: !InfrastructureShared
-- Name: 17ab3eea98b0c
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].ppid
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].ppid
end
if this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p1
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = bm.get_process_notifications(l_0_0)
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4.tag == 4 and l_0_4.rawutf8p1 == l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
