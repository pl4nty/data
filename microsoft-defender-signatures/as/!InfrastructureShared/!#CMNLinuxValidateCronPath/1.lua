-- Threat: !InfrastructureShared
-- Name: !#CMN:Linux/ValidateCronPath
-- Type: 24
-- MpAttributes: HSTR:Linux/CronArtifact.A

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_1 == "cron" or l_0_1 == "crond" then
  if string.find(l_0_0, "/usr/bin", -8, true) or string.find(l_0_0, "/usr/sbin", -9, true) or string.find(l_0_0, "->usr/sbin", -10, true) or string.find(l_0_0, "->sbin", -6, true) or string.find(l_0_0, "/opt", 1, true) == 1 then
    local l_0_2 = mp.getfilesize()
    if l_0_2 == nil or l_0_2 < 307200 then
      return mp.CLEAN
    end
    mp.set_mpattribute("BM_LargeSizeCronBinary")
  else
    mp.set_mpattribute("BM_MasqueradeCronPath")
  end
elseif string.find(l_0_1, ".", 1, true) == 1 or string.find(l_0_0, "/.", 1, true) then
  mp.set_mpattribute("BM_CronWithHiddenName")
else
  mp.set_mpattribute("BM_MasqueradeCronName")
end
return mp.CLEAN
