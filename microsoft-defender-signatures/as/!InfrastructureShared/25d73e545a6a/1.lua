-- Threat: !InfrastructureShared
-- Name: 25d73e545a6a
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "sdclt.exe" then
    local l_0_2 = mp.GetScannedPPID()
    if l_0_2 then
      local l_0_3 = {}
      table.insert(l_0_3, l_0_2)
      MpCommon.SetPersistContextNoPath("UACBypassExp.A!sdclt", l_0_3, 5)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
