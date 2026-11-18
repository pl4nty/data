-- Threat: !InfrastructureShared
-- Name: 64b316071405
-- Type: 21

if this_sigattrlog[1].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[2].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[3].matched == false then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].ppid
local l_0_1 = this_sigattrlog[2].ppid
local l_0_2 = this_sigattrlog[3].ppid
if l_0_0 ~= l_0_1 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = bm.get_process_relationships()
if #l_0_4 < 2 then
  return mp.CLEAN
end
if l_0_4[2].ppid ~= l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
