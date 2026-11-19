-- Threat: !InfrastructureShared
-- Name: 21b30034d31e
-- Type: 21

bm.DisableSignature()
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = 0
  local l_0_1 = this_sigattrlog[1].utf8p2
  l_0_1, l_0_0 = string.gsub(l_0_1, "`", "")
  if 3 < l_0_0 then
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "frombase64string", 1, true) or string.find(l_0_1, "webclient", 1, true) or string.find(l_0_1, "newscriptblock", 1, true) or string.find(l_0_1, "http", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
