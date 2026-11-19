-- Threat: !InfrastructureShared
-- Name: 4d3b316d8a421
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[26].matched and this_sigattrlog[26].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[26].utf8p1)
end
if this_sigattrlog[27].matched and this_sigattrlog[27].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[27].utf8p1)
end
if l_0_0 then
  local l_0_1 = bm.get_imagepath()
  if l_0_1 ~= nil and l_0_1:len() > 11 then
    local l_0_2 = l_0_1:sub(-12):lower()
    if l_0_2 == "\\svchost.exe" then
      local l_0_3 = bm.get_current_process_startup_info()
      if l_0_3 ~= nil and l_0_3.command_line ~= nil then
        local l_0_4 = string.lower(l_0_3.command_line)
        if l_0_4:find("gpsvc", 1, true) then
          return mp.CLEAN
        end
      end
    end
  end
  if l_0_0:find("windowspowershell\\v1.0\\", 1, true) or l_0_0:find("documents\\powershell\\", 1, true) then
    bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
    TrackPidAndTechniqueBM(this_sigattrlog[26].ppid, "T1546.013", "posh_profile_modify")
    return mp.INFECTED
  end
end
return mp.CLEAN
