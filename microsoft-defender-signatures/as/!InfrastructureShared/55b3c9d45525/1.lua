-- Threat: !InfrastructureShared
-- Name: 55b3c9d45525
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_1 ~= nil and MpCommon.GetPersistContextCountNoPath("UACBypassRegSet.A") > 0 then
  local l_0_2 = MpCommon.GetPersistContextNoPath("UACBypassRegSet.A")
  if l_0_2 then
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      if string.lower(l_0_4) == string.lower(l_0_1.ppid) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
