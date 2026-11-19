-- Threat: !InfrastructureShared
-- Name: 221b33fc9a449
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = {}
if this_sigattrlog[3].matched and this_sigattrlog[4].matched then
  local l_0_3 = tostring(this_sigattrlog[3].utf8p2 or "")
  local l_0_4 = tostring(this_sigattrlog[4].utf8p2 or "")
  l_0_3 = l_0_3:gsub("[\128-\255]", "")
  l_0_4 = l_0_4:gsub("[\128-\255]", "")
  if l_0_4 == "" then
    return mp.CLEAN
  end
  if not string.find(l_0_3, "{.-}", 1, false) or not string.find(l_0_4, "{.-}", 1, false) then
    return mp.CLEAN
  end
  if l_0_3 ~= l_0_4 then
    l_0_0 = true
    l_0_1 = "old_value_mismatch" .. "TreatAs"
    l_0_2.CLSID_From = l_0_3
    l_0_2.CLSID_To = l_0_4
  elseif string.find(this_sigattrlog[4].utf8p1, "HKCU\\", 1, true) then
    local l_0_5 = string.gsub(this_sigattrlog[4].utf8p1, "HKCU\\", "HKLM\\")
    local l_0_6 = GetRegistryValue(l_0_5, "")
    l_0_6 = l_0_6:gsub("[\128-\255]", "")
    if not string.find(l_0_3, "{.-}", 1, false) then
      return mp.CLEAN
    end
    if l_0_6 and string.find(l_0_6, "{.-}", 1, false) and l_0_6 ~= l_0_4 then
      l_0_0 = true
      l_0_1 = "hklm_hkcu_mismatch" .. "TreatAs"
      l_0_2.CLSID_From = l_0_6
      l_0_2.CLSID_To = l_0_4
    end
  end
  if l_0_0 then
    l_0_2.parents = add_parents()
    l_0_2.processname = bm.get_imagepath()
    l_0_2.reason = l_0_1
    l_0_2.appId = string.match(this_sigattrlog[4].utf8p1, "({.-})")
    local l_0_7 = safeJsonSerialize(l_0_2) or l_0_2.processname or ""
    AppendToRollingQueue("Potential_COM_Hijacked_CLSIDs", string.lower(l_0_2.CLSID_To), l_0_7, 1800, 100, 0)
    bm.add_related_string("AdditionalInfo", l_0_7, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
