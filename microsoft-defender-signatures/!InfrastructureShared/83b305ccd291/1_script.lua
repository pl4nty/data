-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\83b305ccd291\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = {}
l_0_4.RansomNoteContent = true
l_0_4.RansomNoteTriggerList = true
for l_0_8 = l_0_1, 1, -1 do
  if l_0_2 > 0 and (sigattr_tail[l_0_8]).attribute == 16384 and (sigattr_tail[l_0_8]).utf8p1 and ((sigattr_tail[l_0_8]).utf8p1):byte(1) ~= 37 then
    l_0_3 = l_0_8
    break
  else
    if (sigattr_tail[l_0_8]).attribute == 16491 and (sigattr_tail[l_0_8]).utf8p1 then
      local l_0_9 = (sigattr_tail[l_0_8]).utf8p1
      if l_0_9:find("Note", 1, true) and not l_0_9:find("Notepad", 1, true) and not l_0_4[l_0_9] and l_0_0[l_0_9] == nil then
        l_0_0[l_0_9] = l_0_8
        l_0_2 = l_0_2 + 1
      end
    end
  end
end
do
  if l_0_2 > 0 and l_0_3 and (sigattr_tail[l_0_3]).utf8p1 and (sigattr_tail[l_0_3]).utf8p2 and not ((sigattr_tail[l_0_3]).utf8p2):find("RemoteIp:;", 1, true) then
    local l_0_10 = (sigattr_tail[l_0_3]).utf8p2
    local l_0_11 = {}
    for l_0_15,l_0_16 in (string.gmatch)(l_0_10, "(%w+):([^;]+)") do
      l_0_11[l_0_15] = l_0_16
    end
    if l_0_11.RemoteIp then
      local l_0_17 = (string.match)(l_0_11.RemoteIp, "(.*):(.*)")
      local l_0_18 = {}
      for l_0_22,l_0_23 in pairs(l_0_0) do
        (table.insert)(l_0_18, l_0_22)
      end
      do
        if (bm.get_current_process_startup_info)() == nil then
          local l_0_24 = ""
        end
        local l_0_25 = nil
        local l_0_26 = {}
        local l_0_27 = {}
        for l_0_31 = 1, l_0_1 do
          local l_0_28 = (((sigattr_tail[l_0_3]).utf8p1):match("[^\\]+$")):lower()
          -- DECOMPILER ERROR at PC149: Confused about usage of register: R16 in 'UnsetPending'

          -- DECOMPILER ERROR at PC154: Confused about usage of register: R16 in 'UnsetPending'

          -- DECOMPILER ERROR at PC159: Confused about usage of register: R16 in 'UnsetPending'

          -- DECOMPILER ERROR at PC166: Confused about usage of register: R16 in 'UnsetPending'

          if (sigattr_tail[l_0_22]).attribute == 16389 and (sigattr_tail[l_0_22]).utf8p2 and (sigattr_tail[l_0_22]).utf8p1 and l_0_28 and (((sigattr_tail[l_0_22]).utf8p1):match("[^\\]+$")):lower() and (((sigattr_tail[l_0_22]).utf8p1):match("[^\\]+$")):lower() == l_0_28 and l_0_27[(sigattr_tail[l_0_32]).utf8p2] == nil then
            l_0_27[(sigattr_tail[l_0_32]).utf8p2] = 1
            ;
            (table.insert)(l_0_26, (sigattr_tail[l_0_32]).utf8p2)
          end
        end
        local l_0_33, l_0_34 = , nil
        -- DECOMPILER ERROR at PC206: Overwrote pending register: R14 in 'AssignReg'

        do
          if (MpCommon.GetBehavioralNetworkBlocksSettings and not l_0_34) or nil == nil then
            local l_0_35 = nil
            l_0_35 = {State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED, MaxTimeout = 0, Exclusions = "", AggressiveLevel = 0}
          end
          local l_0_36 = nil
          local l_0_37 = l_0_11.UsrName
          local l_0_38 = l_0_11.Domain
          local l_0_39 = scrubData(l_0_11.UsrName)
          local l_0_40 = scrubData(l_0_11.Domain)
          local l_0_41 = {NotePath = (sigattr_tail[l_0_3]).utf8p1, TriggedSigs = l_0_18, ppID = l_0_25, RemoteInfo = l_0_11, UserName = l_0_39, Domain = l_0_40, Type = "NoteDrop", NoteFileMeta = l_0_26, RemoteEncConfig = l_0_36}
          local l_0_42 = SafeGetUrlReputation
          do
            local l_0_43 = {l_0_17}
            l_0_42 = l_0_42(l_0_43, {SIG_CONTEXT = "BM", CONTEXT_SOURCE = "GenRansomNote", TAG = "NOLOOKUP", data = safeJsonSerialize(l_0_41)})
            l_0_43 = l_0_42.urls
            l_0_43 = l_0_43[l_0_17]
            if l_0_43 ~= nil then
              l_0_43 = l_0_42.urls
              l_0_43 = l_0_43[l_0_17]
              l_0_43 = l_0_43.determination
              if l_0_43 == 2 then
                l_0_43 = l_0_42.urls
                l_0_43 = l_0_43[l_0_17]
                l_0_43 = l_0_43.confidence
                if l_0_43 ~= nil then
                  l_0_43 = l_0_42.urls
                  l_0_43 = l_0_43[l_0_17]
                  l_0_43 = l_0_43.confidence
                  if l_0_43 >= 60 then
                    l_0_43 = l_0_42.urls
                    l_0_43 = l_0_43[l_0_17]
                    l_0_43 = l_0_43.context
                    l_0_43 = l_0_43.Source
                    if l_0_43 == "GenRansomNote" then
                      l_0_43 = l_0_42.urls
                      l_0_43 = l_0_43[l_0_17]
                      l_0_43 = l_0_43.confidence
                      l_0_41.confidence = l_0_43
                      l_0_43 = l_0_42.urls
                      l_0_43 = l_0_43[l_0_17]
                      l_0_43 = l_0_43.context
                      l_0_43 = l_0_43.Family
                      l_0_41.family = l_0_43
                      l_0_41.action, l_0_43 = l_0_43, {action = (((l_0_42.urls)[l_0_17]).context).action, parameter = (((l_0_42.urls)[l_0_17]).context).action_parameter, ttl = (((l_0_42.urls)[l_0_17]).context).action_ttl}
                      l_0_41.ip = l_0_17
                      l_0_41.unscrubbed_username = l_0_37
                      l_0_41.unscrubbed_domain = l_0_38
                      ;
                      (bm.add_related_string)("RemoteGenericMassRansomNoteDrop:Malware", safeJsonSerialize(l_0_41), bm.RelatedStringBMReport)
                    end
                  end
                end
              end
            end
            l_0_43 = mp
            l_0_43 = l_0_43.INFECTED
            do return l_0_43 end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

