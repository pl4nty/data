-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFConnAgentsExecOnHVAJ!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "netbird", 1, true) == nil and (string.find)(l_0_0, "tailscale", 1, true) == nil and (string.find)(l_0_0, "teleport", 1, true) == nil and (string.find)(l_0_0, "cloudflared", 1, true) == nil and (string.find)(l_0_0, "ngrok", 1, true) == nil and (string.find)(l_0_0, "zerotier", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
_ = pcall(MpCommon.QuerySessionInformation, l_0_2, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  if l_0_3 and l_0_4 and l_0_4 ~= "" then
    local l_0_5 = scrubData(l_0_4)
    ;
    (mp.set_mpattribute)("MpInternal_researchdata= DC_RDP: IP_Scrubbed =" .. l_0_5)
    local l_0_6, l_0_7 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
    do
      if l_0_6 and l_0_7 and l_0_7 ~= "" then
        local l_0_8 = scrubData(l_0_7)
        ;
        (mp.set_mpattribute)("MpInternal_researchdata= DC_RDP: Domain_Scrubbed =" .. l_0_8)
      end
      local l_0_9, l_0_10 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
      do
        if l_0_9 and l_0_10 and l_0_10 ~= "" then
          local l_0_11 = scrubData(l_0_10)
          ;
          (mp.set_mpattribute)("MpInternal_researchdata= DC_RDP: User_Scrubbed =" .. l_0_11)
        end
        return mp.CLEAN
      end
    end
  end
end

