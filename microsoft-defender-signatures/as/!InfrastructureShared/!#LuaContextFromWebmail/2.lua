-- Threat: !InfrastructureShared
-- Name: !#//Lua:ContextFromWebmail
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil then
    l_0_0 = l_0_0:lower()
    if string.find(l_0_0, "outlook", 1, true) or string.find(l_0_0, "mail", 1, true) or string.find(l_0_0, "attach", 1, true) or string.find(l_0_0, "message", 1, true) then
      MpCommon.AppendPersistContextNoPath("CLF_AM", "CLF_AM_WM", 60)
      MpCommon.AppendPersistContextNoPath("CLF_IC", mp.getfilename(), 60)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
