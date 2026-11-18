-- Threat: !InfrastructureShared
-- Name: 55b37757f3c8
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, ":\\windows\\", 2, true) or string.find(l_0_1, "^%%", 0) or string.find(l_0_1, "^\\device", 0, false) or string.find(l_0_1, ":\\programdata\\", 2, true) or string.find(l_0_1, "^:\\users\\.*\\appdata", 2, false) or string.find(l_0_1, "\\qtpconfig.blf", 1, true) or string.find(l_0_1, ":\\users\\public\\qiyi", 1, true) or string.find(l_0_1, "ntuser.dat", 1, true) or string.find(l_0_1, ":\\sandbox\\.*\\reghive", 1, false) or string.find(l_0_1, ":\\steam", 1, true) or string.find(l_0_1, ":\\program files (x86)\\", 2, true) or string.find(l_0_1, ":\\program files\\", 2, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
