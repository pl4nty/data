-- Threat: !InfrastructureShared
-- Name: c3b38490834c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = {}
if this_sigattrlog[1].matched and this_sigattrlog[2].matched then
  if string.find(this_sigattrlog[1].utf8p2, "{.-}", 1, false) and tostring(this_sigattrlog[1].utf8p2) ~= tostring(this_sigattrlog[2].utf8p2) then
    l_0_0 = true
    l_0_1 = "old_value_mismatch" .. "TypeLib"
    l_0_2.CLSID_From = this_sigattrlog[1].utf8p2
    l_0_2.CLSID_To = this_sigattrlog[2].utf8p2
  elseif string.find(this_sigattrlog[2].utf8p1, "HKCU\\", 1, true) then
    local l_0_3 = string.gsub(this_sigattrlog[2].utf8p1, "HKCU\\", "HKLM\\")
    local l_0_4 = GetRegistryValue(l_0_3, "")
    if l_0_4 and l_0_4 ~= tostring(this_sigattrlog[2].utf8p2) then
      l_0_0 = true
      l_0_1 = "hklm_hkcu_mismatch" .. "TypeLib"
      l_0_2.CLSID_From = l_0_4
      l_0_2.CLSID_To = this_sigattrlog[2].utf8p2
    end
  end
  if l_0_0 then
    l_0_2.parents = add_parents()
    l_0_2.processname = bm.get_imagepath()
    l_0_2.reason = l_0_1
    l_0_2.appId = string.match(this_sigattrlog[2].utf8p1, "({.-})")
    local l_0_5 = safeJsonSerialize(l_0_2) or l_0_2.processname or ""
    AppendToRollingQueue("Potential_COM_Hijacked_CLSIDs", string.lower(l_0_2.CLSID_To), l_0_5, 1800, 100, 0)
    bm.add_related_string("AdditionalInfo", l_0_5, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
