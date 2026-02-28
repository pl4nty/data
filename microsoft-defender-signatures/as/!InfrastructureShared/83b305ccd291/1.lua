local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = {}
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = 0
L3_1 = 0
L4_1 = {}
L4_1.RansomNoteContent = true
L4_1.RansomNoteTriggerList = true
L5_1 = L1_1
L6_1 = 1
L7_1 = -1
for L8_1 = L5_1, L6_1, L7_1 do
  if 0 < L2_1 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.attribute
    if L9_1 == 16384 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L8_1]
      L9_1 = L9_1.utf8p1
      if L9_1 then
        L9_1 = sigattr_tail
        L9_1 = L9_1[L8_1]
        L9_1 = L9_1.utf8p1
        L10_1 = L9_1
        L9_1 = L9_1.byte
        L11_1 = 1
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 ~= 37 then
          L3_1 = L8_1
          break
      end
    end
  end
  else
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.attribute
    if L9_1 == 16491 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L8_1]
      L9_1 = L9_1.utf8p1
      if L9_1 then
        L9_1 = sigattr_tail
        L9_1 = L9_1[L8_1]
        L9_1 = L9_1.utf8p1
        L11_1 = L9_1
        L10_1 = L9_1.find
        L12_1 = "Note"
        L13_1 = 1
        L14_1 = true
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        if L10_1 then
          L11_1 = L9_1
          L10_1 = L9_1.find
          L12_1 = "Notepad"
          L13_1 = 1
          L14_1 = true
          L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
          if not L10_1 then
            L10_1 = L4_1[L9_1]
            if not L10_1 then
              L10_1 = L0_1[L9_1]
              if L10_1 == nil then
                L0_1[L9_1] = L8_1
                L2_1 = L2_1 + 1
              end
            end
          end
        end
      end
    end
  end
end
if 0 < L2_1 and L3_1 then
  L5_1 = sigattr_tail
  L5_1 = L5_1[L3_1]
  L5_1 = L5_1.utf8p1
  if L5_1 then
    L5_1 = sigattr_tail
    L5_1 = L5_1[L3_1]
    L5_1 = L5_1.utf8p2
    if L5_1 then
      L5_1 = sigattr_tail
      L5_1 = L5_1[L3_1]
      L5_1 = L5_1.utf8p2
      L6_1 = L5_1
      L5_1 = L5_1.find
      L7_1 = "RemoteIp:;"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = sigattr_tail
        L5_1 = L5_1[L3_1]
        L5_1 = L5_1.utf8p2
        L6_1 = {}
        L7_1 = string
        L7_1 = L7_1.gmatch
        L8_1 = L5_1
        L9_1 = "(%w+):([^;]+)"
        L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
        for L10_1, L11_1 in L7_1, L8_1, L9_1 do
          L6_1[L10_1] = L11_1
        end
        L7_1 = L6_1.RemoteIp
        if L7_1 then
          L7_1 = string
          L7_1 = L7_1.match
          L8_1 = L6_1.RemoteIp
          L9_1 = "(.*):(.*)"
          L7_1 = L7_1(L8_1, L9_1)
          L8_1 = {}
          L9_1 = pairs
          L10_1 = L0_1
          L9_1, L10_1, L11_1 = L9_1(L10_1)
          for L12_1, L13_1 in L9_1, L10_1, L11_1 do
            L14_1 = table
            L14_1 = L14_1.insert
            L15_1 = L8_1
            L16_1 = L12_1
            L14_1(L15_1, L16_1)
          end
          L9_1 = bm
          L9_1 = L9_1.get_current_process_startup_info
          L9_1 = L9_1()
          if L9_1 == nil then
            L9_1 = ""
          end
          L10_1 = {}
          L11_1 = {}
          L12_1 = sigattr_tail
          L12_1 = L12_1[L3_1]
          L12_1 = L12_1.utf8p1
          L13_1 = L12_1
          L12_1 = L12_1.match
          L14_1 = "[^\\]+$"
          L12_1 = L12_1(L13_1, L14_1)
          L13_1 = L12_1
          L12_1 = L12_1.lower
          L12_1 = L12_1(L13_1)
          L13_1 = 1
          L14_1 = L1_1
          L15_1 = 1
          for L16_1 = L13_1, L14_1, L15_1 do
            L17_1 = sigattr_tail
            L17_1 = L17_1[L16_1]
            L17_1 = L17_1.attribute
            if L17_1 == 16389 then
              L17_1 = sigattr_tail
              L17_1 = L17_1[L16_1]
              L17_1 = L17_1.utf8p2
              if L17_1 then
                L17_1 = sigattr_tail
                L17_1 = L17_1[L16_1]
                L17_1 = L17_1.utf8p1
                if L17_1 and L12_1 then
                  L17_1 = sigattr_tail
                  L17_1 = L17_1[L16_1]
                  L17_1 = L17_1.utf8p1
                  L18_1 = L17_1
                  L17_1 = L17_1.match
                  L19_1 = "[^\\]+$"
                  L17_1 = L17_1(L18_1, L19_1)
                  L18_1 = L17_1
                  L17_1 = L17_1.lower
                  L17_1 = L17_1(L18_1)
                  if L17_1 and L17_1 == L12_1 then
                    L18_1 = sigattr_tail
                    L18_1 = L18_1[L16_1]
                    L18_1 = L18_1.utf8p2
                    L18_1 = L11_1[L18_1]
                    if L18_1 == nil then
                      L18_1 = sigattr_tail
                      L18_1 = L18_1[L16_1]
                      L18_1 = L18_1.utf8p2
                      L11_1[L18_1] = 1
                      L18_1 = table
                      L18_1 = L18_1.insert
                      L19_1 = L10_1
                      L20_1 = sigattr_tail
                      L20_1 = L20_1[L16_1]
                      L20_1 = L20_1.utf8p2
                      L18_1(L19_1, L20_1)
                    end
                  end
                end
              end
            end
          end
          L13_1 = nil
          L14_1 = nil
          L15_1 = MpCommon
          L15_1 = L15_1.GetBehavioralNetworkBlocksSettings
          if L15_1 then
            L15_1 = pcall
            L16_1 = MpCommon
            L16_1 = L16_1.GetBehavioralNetworkBlocksSettings
            L17_1 = MpCommon
            L17_1 = L17_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
            L15_1, L16_1 = L15_1(L16_1, L17_1)
            L14_1 = L16_1
            L13_1 = L15_1
          end
          if not L13_1 or L14_1 == nil then
            L15_1 = {}
            L16_1 = MpCommon
            L16_1 = L16_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
            L15_1.State = L16_1
            L15_1.MaxTimeout = 0
            L15_1.Exclusions = ""
            L15_1.AggressiveLevel = 0
            L14_1 = L15_1
          end
          L15_1 = L6_1.UsrName
          L16_1 = L6_1.Domain
          L17_1 = scrubData
          L18_1 = L6_1.UsrName
          L17_1 = L17_1(L18_1)
          L18_1 = scrubData
          L19_1 = L6_1.Domain
          L18_1 = L18_1(L19_1)
          L19_1 = {}
          L20_1 = sigattr_tail
          L20_1 = L20_1[L3_1]
          L20_1 = L20_1.utf8p1
          L19_1.NotePath = L20_1
          L19_1.TriggedSigs = L8_1
          L19_1.ppID = L9_1
          L19_1.RemoteInfo = L6_1
          L19_1.UserName = L17_1
          L19_1.Domain = L18_1
          L19_1.Type = "NoteDrop"
          L19_1.NoteFileMeta = L10_1
          L19_1.RemoteEncConfig = L14_1
          L20_1 = SafeGetUrlReputation
          L21_1 = {}
          L22_1 = L7_1
          L21_1[1] = L22_1
          L22_1 = {}
          L22_1.SIG_CONTEXT = "BM"
          L22_1.CONTEXT_SOURCE = "GenRansomNote"
          L22_1.TAG = "NOLOOKUP"
          L23_1 = safeJsonSerialize
          L24_1 = L19_1
          L23_1 = L23_1(L24_1)
          L22_1.data = L23_1
          L20_1 = L20_1(L21_1, L22_1)
          L21_1 = L20_1.urls
          L21_1 = L21_1[L7_1]
          if L21_1 ~= nil then
            L21_1 = L20_1.urls
            L21_1 = L21_1[L7_1]
            L21_1 = L21_1.determination
            if L21_1 == 2 then
              L21_1 = L20_1.urls
              L21_1 = L21_1[L7_1]
              L21_1 = L21_1.confidence
              if L21_1 ~= nil then
                L21_1 = L20_1.urls
                L21_1 = L21_1[L7_1]
                L21_1 = L21_1.confidence
                if 60 <= L21_1 then
                  L21_1 = L20_1.urls
                  L21_1 = L21_1[L7_1]
                  L21_1 = L21_1.context
                  L21_1 = L21_1.Source
                  if L21_1 == "GenRansomNote" then
                    L21_1 = L20_1.urls
                    L21_1 = L21_1[L7_1]
                    L21_1 = L21_1.confidence
                    L19_1.confidence = L21_1
                    L21_1 = L20_1.urls
                    L21_1 = L21_1[L7_1]
                    L21_1 = L21_1.context
                    L21_1 = L21_1.Family
                    L19_1.family = L21_1
                    L21_1 = {}
                    L22_1 = L20_1.urls
                    L22_1 = L22_1[L7_1]
                    L22_1 = L22_1.context
                    L22_1 = L22_1.action
                    L21_1.action = L22_1
                    L22_1 = L20_1.urls
                    L22_1 = L22_1[L7_1]
                    L22_1 = L22_1.context
                    L22_1 = L22_1.action_parameter
                    L21_1.parameter = L22_1
                    L22_1 = L20_1.urls
                    L22_1 = L22_1[L7_1]
                    L22_1 = L22_1.context
                    L22_1 = L22_1.action_ttl
                    L21_1.ttl = L22_1
                    L19_1.action = L21_1
                    L19_1.ip = L7_1
                    L19_1.unscrubbed_username = L15_1
                    L19_1.unscrubbed_domain = L16_1
                    L22_1 = bm
                    L22_1 = L22_1.add_related_string
                    L23_1 = "RemoteGenericMassRansomNoteDrop:Malware"
                    L24_1 = safeJsonSerialize
                    L25_1 = L19_1
                    L24_1 = L24_1(L25_1)
                    L25_1 = bm
                    L25_1 = L25_1.RelatedStringBMReport
                    L22_1(L23_1, L24_1, L25_1)
                  end
                end
              end
            end
          end
          L21_1 = MpCommon
          L21_1 = L21_1.IsSampled
          L22_1 = 10000
          L23_1 = true
          L24_1 = true
          L25_1 = true
          L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
          if L21_1 == true then
            L21_1 = pcall
            L22_1 = reportBmInfoUrlRep
            L23_1 = {}
            L23_1.ip = L7_1
            L21_1(L22_1, L23_1)
          end
          L21_1 = mp
          L21_1 = L21_1.INFECTED
          return L21_1
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
