-- Threat: !InfrastructureShared
-- Name: 32b3e78e2066
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched then
  do
    local l_0_0 = this_sigattrlog[1].utf8p2
    local l_0_1 = split(l_0_0, ",")
    local l_0_2 = {}
    
    function processActions(l_1_0)
      for l_1_1, l_1_2 in pairs(l_1_0) do
        local l_1_3 = MpCommon.Base64Decode(l_1_2)
        l_1_3 = explode(l_1_3, "_")
        for l_1_4, l_1_5 in ipairs(l_1_3) do
          l_1_5 = split(l_1_5, ":")
          local l_1_6, l_1_7 = pcall(mp.GetPPidFromPid, l_1_5[1])
          l_0_2[l_1_5[1]] = {success = l_1_6, ppid = l_1_7}
          if l_1_6 then
            local l_1_8 = l_1_5[2]
            bm.trigger_sig("Heimdall_ProcessActions", l_1_8, l_1_7)
          end
        end
      end
    end
    
    local l_0_3, l_0_4 = pcall(processActions, l_0_1)
    if not l_0_3 then
      l_0_2.error = {error = l_0_4}
      l_0_2.TAG = "NOLOOKUP"
    end
    pcall(mp.GetUrlReputation, {
      "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
    }, safeJsonSerialize(l_0_2))
  end
end
return mp.CLEAN
