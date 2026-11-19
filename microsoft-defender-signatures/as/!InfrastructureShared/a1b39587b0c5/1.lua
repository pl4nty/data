-- Threat: !InfrastructureShared
-- Name: a1b39587b0c5
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[3].utf8p2)
  if tonumber(l_0_0.append_size) >= 1000 and l_0_0.appended_ext:lower() == ".play" then
    reportTimingData()
    bm.add_related_string("file_append_meta", this_sigattrlog[3].utf8p2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
