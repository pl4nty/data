-- Threat: !InfrastructureShared
-- Name: !#SLF:Linux/HiddenFileChangeByProcess.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & (BM_LINUX_CORE_FILE_TYPE | BM_XPLAT_SCRIPT_OR_TEXT_FILE_TYPE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FNAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, ".", 1, true) == 1 then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_2 == nil or #l_0_2 < 4 then
    return mp.CLEAN
  end
  if l_0_2 == "/var/tmp" or l_0_2 == "/tmp" or l_0_2 == "/dev/shm" or l_0_2 == "/root" or l_0_2 == "/home" then
    return mp.INFECTED
  end
  local l_0_3 = {
    "/var/tmp/",
    "/tmp/",
    "/dev/shm/",
    "/root/",
    "/home/"
  }
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if string.find(l_0_2, l_0_5, 1, true) == 1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
