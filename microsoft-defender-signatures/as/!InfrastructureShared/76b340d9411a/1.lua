-- Threat: !InfrastructureShared
-- Name: 76b340d9411a
-- Type: 21

if not (this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1) or not this_sigattrlog[3].utf8p2 then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
if 500 <= #l_0_0 then
  bm.set_detection_string(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
