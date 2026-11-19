-- Threat: !InfrastructureShared
-- Name: 136d7afc42af3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["supportassistagent.exe"] = true,
    ["printixservice.exe"] = true,
    ["vpnagent.exe"] = true,
    ["ossec-agent.exe"] = true,
    ["pangps.exe"] = true,
    ["cthwiprvservice.exe"] = true,
    ["ctesdursvc.exe"] = true,
    ["node.exe"] = true,
    ["heimdal.darklayerguard.exe"] = true,
    ["fortisslvpndaemon.exe"] = true,
    ["ccmexec.exe"] = true,
    ["gpscript.exe"] = true,
    ["mpcmdrun.exe"] = true,
    ["mssense.exe"] = true,
    ["senseir.exe"] = true,
    ["solsticeclient.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if l_0_1:find("\\daragent\\", 1, true) then
    return mp.CLEAN
  end
end
if IsTacticObservedForParents(l_0_0.ppid, "ttexclusion", 3) then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1016", "network_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.CLEAN
