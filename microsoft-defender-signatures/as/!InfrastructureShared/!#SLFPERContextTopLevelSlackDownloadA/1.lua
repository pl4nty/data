-- Threat: !InfrastructureShared
-- Name: !#SLFPER:ContextTopLevelSlackDownload.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.getfilesize() < 400 then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\downloads", 1, true) then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
    local l_0_3 = string.sub(l_0_2, -4)
    if l_0_3 == ".mp3" or l_0_3 == ".mp4" or l_0_3 == ".jpg" or l_0_3 == ".mov" then
      return mp.CLEAN
    end
    local l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_4 == "slack.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
