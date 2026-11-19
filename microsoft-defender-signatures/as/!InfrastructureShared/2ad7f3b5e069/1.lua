-- Threat: !InfrastructureShared
-- Name: 2ad7f3b5e069
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["iaprintmanager.exe"] = true,
    ["sdiagnhost.exe"] = true,
    ["qq.exe"] = true,
    ["printixservice.exe"] = true,
    ["lnsscomm.exe"] = true,
    ["webexmta.exe"] = true,
    ["supportassistagent.exe"] = true,
    ["vpnagent.exe"] = true,
    ["ossec-agent.exe"] = true,
    ["pangps.exe"] = true,
    ["cthwiprvservice.exe"] = true,
    ["ctesdursvc.exe"] = true,
    ["node.exe"] = true,
    ["heimdal.darklayerguard.exe"] = true,
    ["fortisslvpndaemon.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1016", "network_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
