-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e8b3ce3384bf\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0, l_0_1, l_0_3, l_0_4 = nil, nil
  l_0_3 = this_sigattrlog
  l_0_3 = l_0_3[2]
  l_0_1 = l_0_3.utf8p1
  local l_0_2, l_0_5 = nil
else
end
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    do return mp.CLEAN end
    do
      if not (this_sigattrlog[4]).matched then
        local l_0_6 = (this_sigattrlog[3]).utf8p2
      end
      if not (this_sigattrlog[5]).matched then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

      local l_0_7 = nil
      if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_6)) then
        local l_0_8 = (this_sigattrlog[3]).utf8p1
        local l_0_9 = nil
        -- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

        if not isnull(((mp.GetExecutablesFromCommandLine)(l_0_7))) then
          local l_0_10 = nil
          -- DECOMPILER ERROR at PC94: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC112: Overwrote pending register: R6 in 'AssignReg'

          if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil then
            local l_0_11 = nil
            local l_0_12 = nil
            -- DECOMPILER ERROR at PC125: Confused about usage of register: R6 in 'UnsetPending'

            if (string.match)(nil, "\\([^\\]+)$") ~= nil and nil ~= nil and (string.find)(nil, (string.match)(nil, "\\([^\\]+)$"), 1, true) then
              (bm.add_related_string)("CorrelatedExclusion", "AV_exclusion_matches_svc_binary", bm.RelatedStringBMReport)
            end
            if not true then
              return mp.CLEAN
            end
            if (mp.IsKnownFriendlyFile)(l_0_12, true, false) then
              return mp.CLEAN
            end
            do
              if l_0_8 ~= nil then
                local l_0_13 = nil
                if (string.match)((string.lower)(l_0_8), "\\services\\([^\\]+)") then
                  (bm.add_related_string)("HijackedService", (string.match)((string.lower)(l_0_8), "\\services\\([^\\]+)"), bm.RelatedStringBMReport)
                end
              end
              if (sysio.IsFileExists)(l_0_12) then
                (bm.add_related_file)(l_0_12)
                ;
                (bm.add_threat_file)(l_0_12)
              end
              TrackFileAndTechnique(l_0_12, "T1543.003:svc_hijack_with_av_excl", 1000)
              TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack_excl")
              TrackPidAndTechniqueBM("BM", "T1562.001", "av_tamper_svc_hijack")
              TrackPidAndTechniqueBM("BM", "T1543.003", "susp_svc_dll_hijack_excl")
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end

