-- Threat: !InfrastructureShared
-- Name: 5bb329340340
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" then
  local l_0_0 = this_sigattrlog[2].utf8p1
  local l_0_1 = bm.get_imagepath()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
    return mp.CLEAN
  end
  bm.trigger_sig("MacDelQuarantineAttr", l_0_0)
  if string.find(l_0_1, "/xattr", -6, true) ~= nil then
    local l_0_2 = mp.GetParentProcInfo()
    if l_0_2 ~= nil and l_0_2.ppid ~= nil then
      bm.trigger_sig("MacDelQuarantineAttr", l_0_0, l_0_2.ppid)
    end
  end
  TrackPidAndTechniqueBM("BM", "T1553.001", "DefenseEvasion_GateKeeperBypass_xattr")
  return mp.INFECTED
end
return mp.CLEAN
