-- Threat: !InfrastructureShared
-- Name: d7b3d3c18714
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0, l_0_1
local l_0_2 = {}
if this_sigattrlog[1].matched and this_sigattrlog[2].matched then
  local l_0_3 = this_sigattrlog[1].utf8p2
  if not string.find(string.lower(l_0_3), "http", 1, true) then
    return mp.CLEAN
  end
  if this_sigattrlog[1].utf8p2 ~= this_sigattrlog[2].utf8p2 then
    local l_0_4, l_0_5 = UrlGrader(this_sigattrlog[2].utf8p2, "Behavior:Win32/COMHijacking.D", false)
    if l_0_4 ~= 0 then
      l_0_2.URL_Grading_Info = l_0_5
    end
    l_0_0 = true
    l_0_1 = "old_value_mismatch" .. "ScriptletUrl"
    l_0_2.old_url = this_sigattrlog[1].utf8p2
    l_0_2.new_url = this_sigattrlog[2].utf8p2
  elseif string.find(this_sigattrlog[2].utf8p1, "HKCU\\", 1, true) then
    local l_0_6 = string.gsub(this_sigattrlog[2].utf8p1, "HKCU\\", "HKLM\\")
    local l_0_7 = GetRegistryValue(l_0_6, "")
    if l_0_7 and l_0_7 ~= this_sigattrlog[2].utf8p2 then
      l_0_0 = true
      l_0_1 = "hklm_hkcu_mismatch" .. "ScriptletUrl"
      l_0_2.hklm_url = l_0_7
      l_0_2.hkcu_url = this_sigattrlog[2].utf8p2
    end
  end
  if l_0_0 then
    l_0_2.parents = add_parents()
    l_0_2.processname = bm.get_imagepath()
    l_0_2.reason = l_0_1
    l_0_2.appId = string.match(this_sigattrlog[2].utf8p1, "({.-})")
    local l_0_8 = safeJsonSerialize(l_0_2) or l_0_2.processname or ""
    bm.add_related_string("AdditionalInfo", l_0_8, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
