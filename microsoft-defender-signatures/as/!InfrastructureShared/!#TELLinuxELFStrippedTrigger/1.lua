-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/ELFStrippedTrigger
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: (BM_ELF_FILE & elfa_isstripped)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "/var/tmp/",
  "/tmp/",
  "/dev/shm/",
  "/mnt/",
  "/root/",
  "/srv/ftp/",
  "/var/spool/"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_0:sub(1, #l_0_3) == l_0_3 then
    local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_4 then
      MpCommon.BmTriggerSig(l_0_4, "BM_ELFStrippedTrigger", l_0_0)
    end
    taint(l_0_0, "stripped_elf_created_taint", 3600)
    return mp.INFECTED
  end
end
return mp.CLEAN
