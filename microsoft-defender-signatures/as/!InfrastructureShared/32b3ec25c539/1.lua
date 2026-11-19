-- Threat: !InfrastructureShared
-- Name: 32b3ec25c539
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  if StringEndsWith(l_0_0, "\\ntds.dit") then
    if l_0_0:find("\\harddiskvolumeshadowcopy", 1, true) then
      return mp.CLEAN
    end
    if StringStartsWith(l_0_1, "\\\\.\\") or StringStartsWith(l_0_1, "\\\\?\\") or l_0_1:find("\\device\\", 1, true) or l_0_1:find("\\volume{", 1, true) then
      _, l_0_1 = pcall(MpCommon.PathToWin32Path, l_0_1)
    elseif StringStartsWith(l_0_1, "%") then
      _, l_0_1 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_1)
    end
    if l_0_1 ~= nil then
      local l_0_2, l_0_3 = l_0_1:match("^\\\\(.-)\\(.+)$")
      if l_0_2 ~= nil and l_0_3 ~= nil then
        if StringStartsWith(l_0_3, "c$\\") or StringStartsWith(l_0_3, "admin$\\") then
          AddPidSpecificTechniqueAndTactic("BM", "T1021.002", "ntdsexfil_to_adminshares")
        end
        AddPidSpecificTechniqueAndTactic("BM", "T1020", "exfil_to_networkshare")
        AppendToRollingQueue("SuspExfilServer", l_0_2, nil, 5000)
      end
      AppendToRollingQueue("SuspNtdsExfilPath", l_0_1, nil, 5000)
      TrackPidAndTechniqueBM("BM", "T1003.003", "ntdsexfil_from_shadowcopy")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
