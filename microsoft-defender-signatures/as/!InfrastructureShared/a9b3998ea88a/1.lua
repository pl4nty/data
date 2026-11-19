-- Threat: !InfrastructureShared
-- Name: a9b3998ea88a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if #l_0_0 < 62 then
  return mp.CLEAN
end
if contains(l_0_0, {
  "powershell",
  " mshta",
  " bitsadmin",
  "curl"
}) then
  bm.add_related_string("typedpath", tostring(l_0_0), bm.RelatedStringBMReport)
  add_parents()
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_CREATED)
    local l_0_6 = l_0_4.image_path
    local l_0_7 = l_0_4.ppid
    if l_0_6 and l_0_7 and l_0_5 == bm.RELATIONSHIP_CREATED and contains(l_0_6, {
      "powershell.exe",
      "mshta.exe",
      "bitsadmin.exe",
      "curl.exe",
      "cmd.exe"
    }) then
      bm.trigger_sig("StartedViatypedpaths", "StartedViatypedpaths", l_0_4.ppid)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
