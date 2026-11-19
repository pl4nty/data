-- Threat: !InfrastructureShared
-- Name: 207b3817372ec
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(string.match(l_0_3.image_path, "\\([^\\]+)$"))
    if l_0_4 == "services.exe" then
      local l_0_5
      local l_0_6 = bm.get_current_process_startup_info()
      if l_0_6 ~= nil and l_0_6.ppid ~= nil then
        l_0_5 = l_0_6.ppid
      end
      local l_0_7 = bm.get_imagepath()
      if l_0_7 ~= nil then
        l_0_7 = MpCommon.PathToWin32Path(l_0_7)
      end
      if l_0_7 == nil or l_0_5 == nil then
        return mp.CLEAN
      end
      l_0_7 = string.lower(l_0_7)
      if StringStartsWith(l_0_7, "%") then
        return mp.CLEAN
      end
      if l_0_7:find("\\adminarsenal\\", 1, true) or l_0_7:find("ccmexec%.exe") or l_0_7:find("bomgar%-scc%.exe") or l_0_7:find("keyacc32%.exe") then
        return mp.CLEAN
      end
      if l_0_7:find("\\temp\\kav remote installations\\", 1, true) or l_0_7:find("\\logmein rescue connectonlan\\lmirescueapplet", 1, true) then
        return mp.CLEAN
      end
      if l_0_7:find("\\veeam.+%.exe") or l_0_7:find("\\f5.+%.exe") then
        return mp.CLEAN
      end
      if l_0_7:find("\\pdq.+%.exe") then
        return mp.CLEAN
      end
      if IsPidExcluded(l_0_5) then
        return mp.CLEAN
      end
      TrackPidAndTechniqueBM(l_0_5, "T1021.002", "remoteservice-target")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
