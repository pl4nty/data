-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\109b3d6a4cc5c\1.luac 

-- params : ...
-- function num : 0
local l_0_2 = nil
local l_0_3 = GetRollingQueueKeys("Medicated64Golang")
do
  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p2) then
    local l_0_0, l_0_1 = GetRollingQueueKeys("Medicated32Golang")
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  if (l_0_3 or l_0_0) and l_0_2 then
    local l_0_4, l_0_5 = , pcall(string.match, l_0_2, "DestIp=([^;]+)")
    if not l_0_5 or isnull(R6_PC41) then
      return mp.CLEAN
    end
    if isPublicIP(R6_PC41) then
      local l_0_6 = nil
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

      R6_PC41 = R6_PC41(l_0_6)
      local l_0_7, l_0_8 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "SusGolang_A_SLIVER_C2"}
      if l_0_8 == 1 and l_0_6 == 1 then
        return mp.CLEAN
      end
      local l_0_9 = nil
      local l_0_10 = SafeGetUrlReputation
      l_0_10 = l_0_10({l_0_6}, l_0_7, false, 3000)
      if (l_0_10.urls)[l_0_6] and ((l_0_10.urls)[l_0_6]).determination ~= 1 and ((l_0_10.urls)[l_0_6]).confidence ~= 90 then
        (bm.add_related_string)("[i] MALICIOUS URL: ", l_0_6, bm.RelatedStringBMReport)
        add_parents()
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

