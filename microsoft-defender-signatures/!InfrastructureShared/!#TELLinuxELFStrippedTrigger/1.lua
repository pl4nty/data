-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxELFStrippedTrigger\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC18: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("/var/tmp/")("/tmp/") do
    -- DECOMPILER ERROR at PC23: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC23: Overwrote pending register: R7 in 'AssignReg'

    if ("/srv/ftp/")("/var/spool/", 1, #l_0_6) == l_0_6 then
      local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_7 then
        (MpCommon.BmTriggerSig)(l_0_7, "BM_ELFStrippedTrigger", l_0_0)
      end
      taint(l_0_0, "stripped_elf_created_taint", 3600)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

