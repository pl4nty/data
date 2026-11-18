-- Threat: !InfrastructureShared
-- Name: ccb3f8a5f063
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.image_path ~= nil and sysio.IsFileExists(l_0_1.image_path) then
    local l_0_2 = mp.GetParentProcInfo(l_0_1.ppid)
    if l_0_2 ~= nil and l_0_2.image_path ~= nil and sysio.IsFileExists(l_0_2.image_path) then
      bm.add_related_file(l_0_2.image_path)
    end
  end
end
return mp.INFECTED
