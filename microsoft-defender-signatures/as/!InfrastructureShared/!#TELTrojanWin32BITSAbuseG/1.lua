-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/BITSAbuse.G
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "svchost.exe" then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_2 = mp.GetProcessCommandLine(l_0_1)
  if l_0_2 == nil or string.len(l_0_2) == 0 then
    return mp.CLEAN
  end
  if string.lower(string.match(l_0_2, "-s%s+([^%s]+)")) ~= "bits" then
    return mp.CLEAN
  end
elseif mp.get_contextdata(mp.CONTEXT_DATA_FILENAME) ~= "sumagar_test.goforit" then
  return mp.CLEAN
end
local l_0_3 = sysio.EnumerateBitsJobs()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7, l_0_8
local l_0_9 = MpCommon.GetPersistContextCountNoPath("urlsFromBitsJobs")
local l_0_10 = {}
if 0 < l_0_9 then
  l_0_10 = MpCommon.GetPersistContextNoPath("urlsFromBitsJobs")
end
l_0_5.SIG_CONTEXT = "LUA_GENERIC"
l_0_5.CONTENT_SOURCE = "BITS"
l_0_5.PROCESS_CONTEXT = "SVCHOST.EXE"
l_0_5.PARENT_CONTEXT = nil
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "false"
l_0_5.BREAK_AT_FIRST_HIT_MALWARE = "40"
local l_0_11 = false
local l_0_12
for l_0_13, l_0_14 in pairs(l_0_3) do
  if string.sub(l_0_14.JobName, 1, 10) ~= "CCMDTS Job" then
    if 256 <= l_0_9 then
      break
    end
    if 30 <= l_0_6 then
      break
    end
    local l_0_15 = string.format("%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", string.byte(l_0_14.JobId, 4), string.byte(l_0_14.JobId, 3), string.byte(l_0_14.JobId, 2), string.byte(l_0_14.JobId, 1), string.byte(l_0_14.JobId, 6), string.byte(l_0_14.JobId, 5), string.byte(l_0_14.JobId, 8), string.byte(l_0_14.JobId, 7), string.byte(l_0_14.JobId, 9, 16))
    local l_0_16 = string.lower(l_0_14.NotifyCmdProgramParam)
    if l_0_16 ~= "" and l_0_16 ~= nil then
      for l_0_17 in string.gmatch(l_0_16, "http[s]?:[^%s\"']+") do
        if 0 < l_0_9 then
          for l_0_18, l_0_19 in ipairs(l_0_10) do
            if l_0_17 == l_0_19 then
              l_0_17 = nil
              break
            end
          end
        end
        if l_0_17 ~= nil then
          local l_0_20, l_0_21 = mp.CheckUrl(l_0_17)
          if l_0_20 == 0 or l_0_20 == 1 and l_0_21 == 0 then
            l_0_6 = l_0_6 + 1
            if 30 < l_0_6 then
              break
            end
            l_0_9 = l_0_9 + 1
            if 256 < l_0_9 then
              break
            end
            table.insert(l_0_4, l_0_6, l_0_17)
            l_0_8 = l_0_15 .. "<$>" .. string.sub(l_0_14.JobName, 1, 32) .. "<$>" .. l_0_14.JobType .. "<$>" .. l_0_14.JobRetryDelay .. "<$>" .. l_0_14.JobNoProgressTimeout .. "<$>" .. l_0_14.JobLastError .. "<$>" .. l_0_14.JobLastErrorContext .. "<$>" .. string.sub(l_0_14.NotifyCmdProgram, 1, 64) .. "<$>" .. string.sub(l_0_14.NotifyCmdProgramParam, 1, 128)
            l_0_7 = tostring(l_0_6)
            l_0_5[l_0_7] = l_0_8
            table.insert(l_0_10, l_0_17)
            MpCommon.AppendPersistContextNoPath("urlsFromBitsJobs", l_0_17, 0)
          end
        end
      end
      for l_0_22 in string.gmatch(l_0_16, "ftp[s]?:[^%s\"']+") do
        if 0 < l_0_9 then
          for l_0_23, l_0_24 in ipairs(l_0_10) do
            if l_0_22 == l_0_24 then
              l_0_22 = nil
              break
            end
          end
        end
        if l_0_22 ~= nil and mp.CheckUrl(l_0_22) ~= 0 then
          local l_0_25, l_0_26 = mp.CheckUrl(l_0_22)
          if l_0_25 == 0 or l_0_25 == 1 and l_0_26 == 0 then
            l_0_6 = l_0_6 + 1
            if 30 < l_0_6 then
              break
            end
            l_0_9 = l_0_9 + 1
            if 256 < l_0_9 then
              break
            end
            table.insert(l_0_4, l_0_6, l_0_22)
            l_0_8 = l_0_15 .. "<$>" .. string.sub(l_0_14.JobName, 1, 32) .. "<$>" .. l_0_14.JobType .. "<$>" .. l_0_14.JobRetryDelay .. "<$>" .. l_0_14.JobNoProgressTimeout .. "<$>" .. l_0_14.JobLastError .. "<$>" .. l_0_14.JobLastErrorContext .. "<$>" .. string.sub(l_0_14.NotifyCmdProgram, 1, 64) .. "<$>" .. string.sub(l_0_14.NotifyCmdProgramParam, 1, 128)
            l_0_7 = tostring(l_0_6)
            l_0_5[l_0_7] = l_0_8
            table.insert(l_0_10, l_0_22)
            MpCommon.AppendPersistContextNoPath("urlsFromBitsJobs", l_0_22, 0)
          end
        end
      end
    end
    if l_0_14.JobFiles ~= nil then
      for l_0_27, l_0_28 in ipairs(l_0_14.JobFiles) do
        if string.find(string.lower(string.sub(l_0_28.FileLocalName, 1, 32)), "\\windows\\ccm\\", 1, true) == nil then
          local l_0_29 = string.lower(l_0_28.FileRemoteName)
          if l_0_29 ~= "" and l_0_29 ~= nil then
            l_0_11, l_0_12 = MpCommon.StringRegExpSearch("[\"]?((http[s]?|ftp[s]?):[^\\s\"']+)[\"]?", l_0_29)
            if l_0_11 == true and l_0_12 ~= "" and l_0_12 ~= nil then
              if 0 < l_0_9 then
                for l_0_30, l_0_31 in ipairs(l_0_10) do
                  if l_0_12 == l_0_31 then
                    l_0_12 = nil
                    break
                  end
                end
              end
              if l_0_12 ~= nil then
                local l_0_32, l_0_33 = mp.CheckUrl(l_0_12)
                if l_0_32 == 0 or l_0_32 == 1 and l_0_33 == 0 then
                  l_0_6 = l_0_6 + 1
                  if 30 < l_0_6 then
                    break
                  end
                  l_0_9 = l_0_9 + 1
                  if 256 < l_0_9 then
                    break
                  end
                  table.insert(l_0_4, l_0_6, l_0_12)
                  l_0_8 = l_0_15 .. "<$>" .. string.sub(l_0_14.JobName, 1, 32) .. "<$>" .. l_0_14.JobType .. "<$>" .. l_0_14.JobRetryDelay .. "<$>" .. l_0_14.JobNoProgressTimeout .. "<$>" .. l_0_14.JobLastError .. "<$>" .. l_0_14.JobLastErrorContext .. "<$>" .. string.sub(l_0_14.NotifyCmdProgram, 1, 64) .. "<$>" .. string.sub(l_0_14.NotifyCmdProgramParam, 1, 128) .. "<$>" .. string.sub(l_0_28.FileLocalName, 1, 128) .. "<$>" .. string.sub(l_0_28.FileRemoteName, 1, 256)
                  l_0_7 = tostring(l_0_6)
                  l_0_5[l_0_7] = l_0_8
                  table.insert(l_0_10, l_0_12)
                  MpCommon.AppendPersistContextNoPath("urlsFromBitsJobs", l_0_12, 0)
                end
              end
            end
          end
        end
      end
    end
  end
end
if l_0_6 == 0 then
  return mp.CLEAN
elseif #l_0_4 == 0 then
  return mp.CLEAN
end
mp.ReportLowfi(mp.getfilename(), 4272609966)
local l_0_34 = mp.GetUrlReputation(l_0_4, l_0_5)
if l_0_34 ~= nil then
  mp.ReportLowfi(mp.getfilename(), 1738771220)
  local l_0_35 = l_0_34.urls
  for l_0_36, l_0_37 in ipairs(l_0_35) do
    local l_0_38
    for l_0_39, l_0_40 in ipairs(l_0_4) do
      if l_0_40 == l_0_37.url then
        l_0_38 = tostring(l_0_39)
      end
    end
    if l_0_38 == nil then
      return mp.CLEAN
    end
    local l_0_41 = string.match(l_0_5[l_0_38], "(.-)<$>")
    if l_0_37.determination == 2 then
      MpCommon.ReportFilelessResource("bitsjob", l_0_41, 4245)
    elseif l_0_37.determination == 3 then
      MpCommon.ReportFilelessResource("bitsjob", l_0_41, 4246)
    elseif l_0_37.determination == 4 then
      MpCommon.ReportFilelessResource("bitsjob", l_0_41, 4247)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
