-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\305b3b092fbba\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 ~= nil then
  local l_0_0, l_0_1, l_0_3, l_0_4 = nil, nil
  l_0_3 = this_sigattrlog
  l_0_3 = l_0_3[12]
  l_0_1 = l_0_3.utf8p1
  local l_0_2, l_0_5 = nil
else
end
do
  if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 ~= nil then
    do return mp.CLEAN end
    local l_0_6 = nil
    if not isnull((mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[13]).utf8p2)) then
      local l_0_7 = (this_sigattrlog[13]).utf8p1
      local l_0_8 = nil
      -- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

      if isnull(((mp.GetExecutablesFromCommandLine)(l_0_6))) or (mp.IsKnownFriendlyFile)(nil, true, false) then
        return mp.CLEAN
      end
      do
        if not isnull(l_0_7) then
          local l_0_9 = nil
          if (string.match)((string.lower)(l_0_7), "\\services\\([^\\]+)") then
            (bm.add_related_string)("HijackedService", (string.match)((string.lower)(l_0_7), "\\services\\([^\\]+)"), bm.RelatedStringBMReport)
          end
        end
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC105: Confused about usage of register: R4 in 'UnsetPending'

        if (sysio.IsFileExists)(nil) then
          (bm.add_related_file)(nil)
          -- DECOMPILER ERROR at PC109: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (bm.add_threat_file)(nil)
        end
        local l_0_10 = nil
        if not isnull((bm.get_imagepath)()) then
          (bm.add_related_string)("AttackerTool", (bm.get_imagepath)(), bm.RelatedStringBMReport)
        end
        -- DECOMPILER ERROR at PC127: Confused about usage of register: R4 in 'UnsetPending'

        TrackFileAndTechnique(nil, "T1543.003:svc_hijack_script_chain", 1000)
        TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack_script")
        TrackPidAndTechniqueBM("BM", "T1543.003", "susp_svc_dll_hijack_script")
        return mp.INFECTED
      end
    end
  end
end

