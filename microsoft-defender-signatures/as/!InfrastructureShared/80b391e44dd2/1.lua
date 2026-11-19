-- Threat: !InfrastructureShared
-- Name: 80b391e44dd2
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  l_0_0 = l_0_0:match("=(https?://.-);")
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "B64decode"
  l_0_1.FILELESS = "true"
  l_0_1.CMDLINE_URL = "false"
  local l_0_2, l_0_3 = ExtractUrlGetReputation(l_0_0, l_0_1, true, 2, 60, false, 3000)
  if l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
