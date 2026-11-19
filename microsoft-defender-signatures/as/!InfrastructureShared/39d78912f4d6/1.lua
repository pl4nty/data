-- Threat: !InfrastructureShared
-- Name: 39d78912f4d6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["dcpatchscan.exe"] = true,
    ["dcconfig.exe"] = true,
    ["openit_apicontroller.exe"] = true,
    ["taniumclient.exe"] = true,
    ["dcreplication.exe"] = true,
    ["niniteagent.exe"] = true,
    ["qqgame.exe"] = true,
    ["xeclient.exe"] = true,
    ["xeservice.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if l_0_2:find("office365_installer", 1, true) or l_0_2:find("ninite", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1560", "archive_collected_data")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
