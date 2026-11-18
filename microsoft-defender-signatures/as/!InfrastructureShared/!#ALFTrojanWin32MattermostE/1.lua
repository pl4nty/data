-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Mattermost.E
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and (l_0_0:find("czhgtiigmfsyxgne2nyoufaqp5jvr76hiiueq4qp5elqjtpho6fx3iid.onion/", 1, true) or l_0_0:find("xkyn2emjzrbi5h4uffqc4ymi2dx3qh4ovoy27cm72ee4wljlkw6cljyd.onion/", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
