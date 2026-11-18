-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/RspContainsRegsvr
-- Type: 13
-- Includes: Path
-- MpAttributes: SCPT:Regsvr & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if (l_0_0 == "odbcconf.exe" or l_0_0 == "explorer.exe") and mp.getfilesize() <= 4096 then
  local l_0_1 = string.lower(tostring(headerpage))
  local l_0_2 = l_0_1:gmatch("regsvr%s+([%a%d\\.]*)")
  local l_0_3 = 5
  local l_0_4 = 0
  local l_0_5 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  l_0_5 = normalize_path(l_0_5)
  for l_0_6 in l_0_2, nil, nil do
    local l_0_7 = l_0_5 .. "\\" .. l_0_6
    local l_0_8 = "DllFromRsp"
    local l_0_9 = MpCommon.QueryPersistContext(l_0_7, l_0_8)
    if not l_0_9 then
      MpCommon.AppendPersistContext(l_0_7, l_0_8, 100)
      l_0_4 = l_0_4 + 1
    end
    if l_0_3 <= l_0_4 then
      break
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
