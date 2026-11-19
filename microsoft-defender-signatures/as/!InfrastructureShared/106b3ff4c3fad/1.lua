-- Threat: !InfrastructureShared
-- Name: 106b3ff4c3fad
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid ~= nil and (string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
  return mp.CLEAN
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  local l_0_1 = this_sigattrlog[5].utf8p1
  local l_0_2 = this_sigattrlog[5].utf8p2
  if l_0_1 ~= nil and l_0_2 ~= nil then
    AppendToRollingQueue("BmMsSenseComponentTamperA", l_0_1, l_0_2, 180)
  end
end
return mp.INFECTED
