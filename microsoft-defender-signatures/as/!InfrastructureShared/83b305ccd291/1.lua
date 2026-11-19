-- Threat: !InfrastructureShared
-- Name: 83b305ccd291
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = {RansomNoteContent = true, RansomNoteTriggerList = true}
for l_0_5 = l_0_1, 1, -1 do
  if 0 < l_0_2 and sigattr_tail[l_0_5].attribute == 16384 and sigattr_tail[l_0_5].utf8p1 and sigattr_tail[l_0_5].utf8p1:byte(1) ~= 37 then
    l_0_3 = l_0_5
    break
  elseif sigattr_tail[l_0_5].attribute == 16491 and sigattr_tail[l_0_5].utf8p1 then
    local l_0_6 = sigattr_tail[l_0_5].utf8p1
    if l_0_6:find("Note", 1, true) and not l_0_6:find("Notepad", 1, true) and not l_0_4[l_0_6] and l_0_0[l_0_6] == nil then
      l_0_0[l_0_6] = l_0_5
      l_0_2 = l_0_2 + 1
    end
  end
end
if 0 < l_0_2 and l_0_3 and sigattr_tail[l_0_3].utf8p1 and sigattr_tail[l_0_3].utf8p2 and not sigattr_tail[l_0_3].utf8p2:find("RemoteIp:;", 1, true) then
  local l_0_7 = sigattr_tail[l_0_3].utf8p2
  local l_0_8 = {}
  for l_0_9, l_0_10 in string.gmatch(l_0_7, "(%w+):([^;]+)") do
    l_0_8[l_0_9] = l_0_10
  end
  if l_0_8.RemoteIp then
    local l_0_11 = string.match(l_0_8.RemoteIp, "(.*):(.*)")
    local l_0_12 = {}
    for l_0_13, l_0_14 in pairs(l_0_0) do
      table.insert(l_0_12, l_0_13)
    end
    local l_0_15 = bm.get_current_process_startup_info()
    if l_0_15 == nil then
      l_0_15 = ""
    end
    local l_0_16 = {}
    local l_0_17 = {}
    local l_0_18 = sigattr_tail[l_0_3].utf8p1:match("[^\\]+$"):lower()
    for l_0_19 = 1, l_0_1 do
      if sigattr_tail[l_0_19].attribute == 16389 and sigattr_tail[l_0_19].utf8p2 and sigattr_tail[l_0_19].utf8p1 and l_0_18 then
        local l_0_20 = sigattr_tail[l_0_19].utf8p1:match("[^\\]+$"):lower()
        if l_0_20 and l_0_20 == l_0_18 and l_0_17[sigattr_tail[l_0_19].utf8p2] == nil then
          l_0_17[sigattr_tail[l_0_19].utf8p2] = 1
          table.insert(l_0_16, sigattr_tail[l_0_19].utf8p2)
        end
      end
    end
    local l_0_21, l_0_22
    if MpCommon.GetBehavioralNetworkBlocksSettings then
      l_0_21, l_0_22 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    end
    if not l_0_21 or l_0_22 == nil then
      l_0_22 = {
        State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
        MaxTimeout = 0,
        Exclusions = "",
        AggressiveLevel = 0
      }
    end
    local l_0_23 = l_0_8.UsrName
    local l_0_24 = l_0_8.Domain
    local l_0_25 = scrubData(l_0_8.UsrName)
    local l_0_26 = scrubData(l_0_8.Domain)
    local l_0_27 = {
      NotePath = sigattr_tail[l_0_3].utf8p1,
      TriggedSigs = l_0_12,
      ppID = l_0_15,
      RemoteInfo = l_0_8,
      UserName = l_0_25,
      Domain = l_0_26,
      Type = "NoteDrop",
      NoteFileMeta = l_0_16,
      RemoteEncConfig = l_0_22
    }
    local l_0_28 = "GenRansomNote_enc"
    local l_0_29 = 36000
    local l_0_30 = 10
    local l_0_31 = bm.get_current_process_startup_info()
    if l_0_31 ~= nil and l_0_31.ppid ~= nil then
      local l_0_32 = tostring(l_0_31.ppid)
      if l_0_11 and l_0_11 ~= "" then
        l_0_32 = l_0_32 .. "|" .. l_0_11
      end
      AppendToRollingQueue(l_0_28, l_0_32, safeJsonSerialize(l_0_27), l_0_29, l_0_30, 1)
      l_0_27.typex_enc_transfer = "success"
    else
      l_0_27.typex_enc_transfer = "failure"
    end
    local l_0_33, l_0_34 = pcall(getBmInfo)
    if l_0_33 and l_0_34 then
      l_0_27.BmInfo = l_0_34
    end
    local l_0_35 = SafeGetUrlReputation({l_0_11}, {
      SIG_CONTEXT = "BM",
      CONTEXT_SOURCE = "GenRansomNote",
      TAG = "NOLOOKUP",
      data = safeJsonSerialize(l_0_27)
    })
    l_0_27.BmInfo = nil
    if l_0_35.urls[l_0_11] ~= nil and l_0_35.urls[l_0_11].determination == 2 and l_0_35.urls[l_0_11].confidence ~= nil and l_0_35.urls[l_0_11].confidence >= 60 and l_0_35.urls[l_0_11].context.Source == "GenRansomNote" then
      l_0_27.confidence = l_0_35.urls[l_0_11].confidence
      l_0_27.family = l_0_35.urls[l_0_11].context.Family
      local l_0_36 = {
        action = l_0_35.urls[l_0_11].context.action,
        parameter = l_0_35.urls[l_0_11].context.action_parameter,
        ttl = l_0_35.urls[l_0_11].context.action_ttl
      }
      l_0_27.action = l_0_36
      l_0_27.ip = l_0_11
      l_0_27.unscrubbed_username = l_0_23
      l_0_27.unscrubbed_domain = l_0_24
      bm.add_related_string("RemoteGenericMassRansomNoteDrop:Malware", safeJsonSerialize(l_0_27), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
