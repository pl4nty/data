-- Threat: !InfrastructureShared
-- Name: cbb30390a357
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_2 = this_sigattrlog[1].utf8p1:lower()
  if string.byte(l_0_2) == string.byte("%") then
    l_0_2 = string.match(l_0_2, "%%common_appdata%%\\(.*)")
  else
    l_0_2 = string.match(l_0_2, "^[%a]:\\[^\\]+\\(.*)")
  end
  if l_0_2:find("\\", 1, true) == nil then
    if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 and this_sigattrlog[4].utf8p2 then
      l_0_1 = this_sigattrlog[4].utf8p1
      l_0_0 = mp.INFECTED
    elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 and this_sigattrlog[2].utf8p2 then
      l_0_1 = this_sigattrlog[2].utf8p1
      l_0_0 = mp.INFECTED
    elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 and this_sigattrlog[3].utf8p2 then
      l_0_1 = this_sigattrlog[3].utf8p1
      l_0_0 = mp.INFECTED
    end
    if l_0_0 == mp.INFECTED and this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
      local l_0_3 = {
        type = l_0_1,
        cmd = this_sigattrlog[1].utf8p2
      }
      bm.add_related_string("ransom_meta", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:AAA", safeJsonSerialize(l_0_3))
      reportSessionInformation()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
