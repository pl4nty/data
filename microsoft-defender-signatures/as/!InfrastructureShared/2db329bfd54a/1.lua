-- Threat: !InfrastructureShared
-- Name: 2db329bfd54a
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].ppid
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_1, ".dat", 1, true) and string.find(l_0_1, "--", 1, true) and string.find(l_0_1, "#1", 1, true) and string.find(l_0_1, "=\"", 1, true) and l_0_0 then
    bm.request_SMS(l_0_0, "m")
    return mp.INFECTED
  end
end
return mp.CLEAN
